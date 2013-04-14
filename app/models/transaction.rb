class Transaction < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  belongs_to :item

  attr_accessible :customer, :merchant, :item, :item_quantity

  def total
    (item.price * item_quantity).to_f
  end
end
