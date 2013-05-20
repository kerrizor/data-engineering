require 'spec_helper'

describe ActivityLogsController do

  let(:user) { User.create!({ name: 'Test User',
                           email: 'user@example.com',
                           password: 'password',
                           password_confirmation: 'password' }) }

  let!(:example_file) { fixture_file_upload(Rails.root + 'example_input.tab') }

  context "when signed in" do
    before(:each) do
      sign_in user
    end

    context "when accessing #new" do
      it "should respond successfully to #new" do
        get :new

        response.should be_success
      end
    end

    context "when accessing #create" do
      it "should redirect if the file is not present" do
        post :create

        response.should be_redirect
      end

      it "should redirect if the file is not present" do
        post :create, { activity_log: { file: example_file } }

        flash[:notice].should == "Successfully imported a new Activity Log."
        response.should be_redirect
      end
    end
  end
end
