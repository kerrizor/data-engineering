class Customer < ActiveRecord::Base
  has_many :transactions

  attr_accessible :name
end
