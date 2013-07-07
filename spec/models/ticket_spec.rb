require 'spec_helper'

describe Ticket do
  before(:each) do
      FactoryGirl.create(:event, :id => 1)
    end
  it "must have valid factory" do
    FactoryGirl.create(:ticket, :event_id => 1).should be_valid
  end
  it "must have presence of name, price qty" do
    FactoryGirl.build(:ticket, :name => nil, :price =>nil, :quantity => nil).should_not be_valid
  end
  it "must have price greater than 0" do
    FactoryGirl.build(:ticket, :price => 0).should_not be_valid
  end
  it "must have qty greater than -1" do
    FactoryGirl.build(:ticket, :quantity => -1).should_not be_valid
  end
  
end
