class SessionsController < ApplicationController
	
	def create
		# env["omniauth.auth"] is hash of details about authenticated user
	  user = User.from_omniauth(env["omniauth.auth"])
	  session[:user_id] = user.id
	  # todo: implement redirect_to root_url, :notice => "Logged in as #{user.name}!"
	  redirect_to request.env['omniauth.origin'] || root_url
	end

	def destroy
		if session[:user_id] != nil
		  session[:user_id] = nil
		  # todo: notice logged out
		  redirect_to request.env['HTTP_REFERER'], :notice => "Logged out"		
		end
	end
end