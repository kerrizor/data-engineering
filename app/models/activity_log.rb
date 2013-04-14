class ActivityLog < ActiveRecord::Base
  has_many :transactions
  attr_accessible :file

  mount_uploader :file, ActivityLogUploader

  def total
    transactions.inject(0){ |sum,t| sum + t.total }
  end
end
