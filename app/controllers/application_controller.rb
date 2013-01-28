class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    # designate as helper method for access within view
    helper_method :current_user
end
