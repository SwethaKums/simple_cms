class ApplicationController < ActionController::Base

#helper_method :current_user

def current_user
    # Implement the logic to return the currently logged-in user here.
    # For example, using Devise, it might be like this:
    @current_user ||= AdminUser.find_by(id: session[:user_id])
  end

private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice]="please login"
       redirect_to(access_login_path)
end
end
end