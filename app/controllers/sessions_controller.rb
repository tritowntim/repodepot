class SessionsController < ApplicationController
	
	def create
		# hash of details about authenticated user
		# raise env["omniauth.auth"].to_json
	  user = User.from_omniauth(env["omniauth.auth"])
	  session[:user_id] = user.id
	  #redirect_to root_url, :notice => "Logged in as #{user.name}!"
	  redirect_to request.env['omniauth.origin'] || root_url
	end

	def destroy
		if session[:user_id] != nil
		  session[:user_id] = nil
		  redirect_to request.env['HTTP_REFERER'], :notice => "Logged out"		
		end
	end
end