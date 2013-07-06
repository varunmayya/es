require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success and goes home" do
      get 'index'
      response.should be_success
      response.should render_template("index")
    end
end

  describe "GET 'howitworks'" do
    it "returns http success" do
      get 'howitworks'
      response.should be_success
      response.should render_template("howitworks")
    end
  end

  describe "GET 'pricing'" do
    it "returns http success" do
      get 'pricing'
      response.should be_success
      response.should render_template("pricing")
    end
  end

end
