require "spec_helper"

describe ApplicationHelper do
  describe "#yield_for" do
    it "returns the proper title if title is there" do
     helper.content_for(:title, 'Home')
     helper.yield_for(:title, 'Event').should eql "Home - EventScene India"
    end
    it "returns the proper title if title is blank" do
    helper.yield_for(:title, 'Event').should eql "Event"
    end
  end
end