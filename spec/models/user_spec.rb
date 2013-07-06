require 'spec_helper'

describe User do
  
  it "must have valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "must be invalid without an Email" do
    FactoryGirl.build(:user, :email => nil).should_not be_valid
  end
  it "must be invalid without a Password" do
      FactoryGirl.build(:user, :password => nil).should_not be_valid
  end
  it "password confirmations must match" do
      FactoryGirl.build(:user, :password => 'happygolucky', :password_confirmation => 'sadgolucky').should_not be_valid
  end
  
  it "does not allow duplicate emails" do 
    FactoryGirl.create(:user) 
    FactoryGirl.build(:user).should_not be_valid
  end
end
