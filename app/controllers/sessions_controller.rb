class SessionsController < ApplicationController
	
	def create
		# hash of details about authenticated user
		# raise env["omniauth.auth"].to_json
	  user = User.from_omniauth(env["omniauth.auth"])
	  session[:user_id] = user.id
	  redirect_to root_url, :notice => "Logged in as #{user.name}!"
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out"		
	end
end