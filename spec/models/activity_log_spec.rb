require 'spec_helper'

describe ActivityLog do
  let(:activity_log) { ActivityLog.create! }

  it "should return a total value for all transactions" do
    item        = FactoryGirl.build(:item)
    transaction = FactoryGirl.build(:transaction, item_quantity: 3)

    activity_log.stub!(:transactions).and_return([transaction])

    activity_log.total.should == 38.97
  end
end
