class Transaction < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  belongs_to :item
  belongs_to :activity_log

  attr_accessible :activity_log, :customer, :merchant, :item, :item_quantity

  def total
    (item.price * item_quantity).to_f
  end
end
