class Merchant < ActiveRecord::Base
  has_many :transactions

  attr_accessible :name, :address
end
