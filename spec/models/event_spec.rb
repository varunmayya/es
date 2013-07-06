require 'spec_helper'

describe Event do
  it "must have valid factory" do
    FactoryGirl.create(:event).should be_valid
  end
  it "must be invalid without valid title" do
    FactoryGirl.build(:event, :title => nil).should_not be_valid
  end
  it "must be invalid without valid logo url" do
     FactoryGirl.build(:event, :logo_url => nil).should_not be_valid
  end
  it "must be invalid without valid city" do
     FactoryGirl.build(:event, :city => nil).should_not be_valid
  end
  it "must be invalid without valid zipcode" do
     FactoryGirl.build(:event, :zipcode => nil).should_not be_valid
  end
  it "must be invalid without valid address" do
     FactoryGirl.build(:event, :address => nil).should_not be_valid
  end
  it "must be invalid without valid city" do
     FactoryGirl.build(:event, :city => nil).should_not be_valid
  end
  it "must be invalid without valid category" do
     FactoryGirl.build(:event, :category => nil).should_not be_valid
  end
  it "must be invalid without valid start_date" do
     FactoryGirl.build(:event, :start_date => nil).should_not be_valid
  end
  it "must be invalid without valid end_date" do
     FactoryGirl.build(:event, :end_date => nil).should_not be_valid
  end
  it "must be invalid without valid start_time" do
     FactoryGirl.build(:event, :start_time => nil).should_not be_valid
  end
  it "must be invalid without valid end_time" do
     FactoryGirl.build(:event, :end_time => nil).should_not be_valid
  end
  it "must have 6 digit zipcode - invalid version" do
     FactoryGirl.build(:event, :zipcode => '56000').should_not be_valid
  end
  it "must have 6 digit zipcode - valid " do
     FactoryGirl.build(:event, :zipcode => '560008').should be_valid
  end
  it "must end in png jpg or gif " do
      FactoryGirl.build(:event, :logo_url => 'http://www.logo.com/pn').should_not be_valid
   end
   it "must end in png jpg or gif " do
        FactoryGirl.build(:event, :logo_url => 'http://www.logo.com/something.png').should be_valid
     end
   it "must end in png jpg or gif " do
           FactoryGirl.build(:event, :logo_url => 'http://www.logo.com/something.gif').should be_valid
   end
    it "must end in png jpg or gif " do
              FactoryGirl.build(:event, :logo_url => 'http://www.logo.com/something.jpg').should be_valid
   end
   
   
   it "must have start date greater or equal to today - check by contradiction" do
        FactoryGirl.build(:event, :start_date => "Feb 24 1981" , :end_date => "Feb 26 2014").should_not be_valid
   end
   it "must have start date greater or equal to today - positive check" do
         FactoryGirl.build(:event, :start_date => "Feb 24 2014", :end_date => "Feb 25 2014").should be_valid 
   end
   
   it "must have end date greater or equal to start date" do
     FactoryGirl.build(:event, :start_date => "Feb 24 2014", :end_date => "Feb 24 2014").should be_valid 
   end
   it "must have end date greater or equal to start date - contradiction case" do
      FactoryGirl.build(:event, :start_date => "Feb 24 2014", :end_date => "Feb 22 2014").should_not be_valid 
    end
   
end
