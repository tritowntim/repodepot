class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def check_authentication
    	redirect_to home_url, :alert => "Would you like to enter new lists, or change existing lists? Please log in with your GitHub account." if current_user.nil?
    end

    def authorized_owner?(list)
      list.user_id == current_user.id 
    end

    # designate as helper method for access within view
    helper_method :current_user
    helper_method :authorized_owner?
end
