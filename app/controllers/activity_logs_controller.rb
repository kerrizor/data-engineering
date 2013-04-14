class ActivityLogsController < ApplicationController
  before_filter :check_for_file, only: [:create]

  def new
    @activity_log = ActivityLog.new
  end

  def create
    @activity_log = ActivityLog.new(params[:activity_log])

    if @activity_log.save
      parse_file(@activity_log)

      flash[:notice] = "Successfully imported a new Activity Log."
      redirect_to @activity_log
    else
      flash[:error] = "Eek! Something blew up!"
      render action: 'new'
    end
  end

  def show
    @activity_log = ActivityLog.find(params[:id], include: :transactions)
  end

  private
  def check_for_file
    unless params[:activity_log][:file]
      flash[:error] = "Oops! Looks like you forgot to attach a file!"
      redirect_to action: 'new'
    end
  end

  def parse_file(activity_log)
    CSV.foreach(activity_log.file.current_path, { headers: true, col_sep: "\t" }) do |row|
      t = Transaction.new(activity_log: activity_log)
      t.customer  = Customer.find_or_create_by_name(name: row["purchaser name"])
      t.item      = Item.find_or_create_by_description(
                      description: row["item description"],
                      price:       row["item price"]
                    )
      t.merchant  = Merchant.find_or_create_by_name(
                      name:    row["merchant name"],
                      address: row["merchant address"]
                    )
      t.item_quantity = row["purchase count"]
      t.save!
    end
  end
end
