class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def check_event_authorization?(event_id)
    if Event.find(event_id).user_id == current_user.id
      return true
    elsif current_user.has_role? :admin
      return true
    else
      return false
  end
end


  def check_event_authorization_or_deny(event_id)
    unless (Event.find(event_id).user_id == current_user.id) || (current_user.has_role? :admin)
   flash[:notice] = "Sorry, this is not your event!"
   redirect_to root_url
  end
end

  
    helper_method :resource, :resource_name, :devise_mapping, :check_event_authorization
end
