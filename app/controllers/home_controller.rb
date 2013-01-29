class HomeController < ApplicationController
	
  def home
  	@throwdown_list = List.where("title = ?", "LinkedIn's Client-Side Templating Throwdown").first
  	@trello_list = List.where("title = ?", "The Trello Stack").first
  	@github_api_list = List.where("title = ?", "GitHub API Wrappers").first

  	@user_list_count = current_user ? List.where(:user_id => current_user.id).count : nil
  	@all_list_count = List.all.count
  end

  def roadmap
  end
end
