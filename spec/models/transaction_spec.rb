require "./spec/spec_helper"

describe Transaction do

  it "should return a total" do
    item        = FactoryGirl.build(:item)
    transaction = FactoryGirl.build(:transaction, item_quantity: 3)

    transaction.total.should == item.price * transaction.item_quantity
  end

end