

class Repository < ActiveRecord::Base
	include Github
  attr_accessible :clone_url, :description, :forks_count, :full_name, :gh_created_at, :gh_updated_at, :html_url, :language, :name, :network_count, :open_issues_count, :owner_login, :pushed_at, :watchers_count
  
  def populate_from_gh
    	# @gh_repo = get_repo :owner_login, :name
    	work_please
    	# puts @gh_repo
  end

end
