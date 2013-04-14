FactoryGirl.define do
  factory :customer do
    name "Amy"
  end

  factory :item do
    description "A thing worth buying"
    price 12.99
  end

  factory :merchant do
    name "Bob's Shop"
    address "123 Main Street"
  end

  factory :transaction do
    customer
    merchant
    item
    item_quantity 1
  end
end