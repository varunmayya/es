class HomeController < ApplicationController

  def index
     session[:registered_from] = home_index_path
  end

  def howitworks
  end

  def pricing
  end



end
