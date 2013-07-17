class RegistrationsController < Devise::RegistrationsController
  protected
  
 before_action :reset_registered_from, :only => :new
 
 
  def after_sign_up_path_for(resource)
    if session[:registered_from] == home_index_path
      flash[:notice] = 'Welcome to EventScene, you can create an event now!'
        new_event_path
      else
        flash[:notice] = 'Welcome to EventScene!'
        root_url
      end
  end
  
def reset_registered_from
  session[:registered_from] = nil
end

end