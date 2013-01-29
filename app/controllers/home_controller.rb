class HomeController < ApplicationController
  def home
  	@throwdown_list = List.where("title = ?", "LinkedIn's Client-Side Templating Throwdown").first
  	@trello_list = List.where("title = ?", "The Trello Stack").first
  	@github_api_list = List.where("title = ?", "GitHub API Wrappers").first
  end
end
