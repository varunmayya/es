class RegistrationsController < Devise::RegistrationsController
  protected
  
 before_action :reset_registered_from, :only => :new
 
 
  def after_sign_up_path_for(resource)
    if session[:registered_from] == home_index_path
        new_event_path
      else
        home_index_path
      end
  end
  
def reset_registered_from
  session[:registered_from] = nil
end

end