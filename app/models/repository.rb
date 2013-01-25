class Repository < ActiveRecord::Base
  attr_accessible :clone_url, :description, :forks_count, :full_name, :gh_created_at, :gh_updated_at, :html_url, :language, :name, :network_count, :open_issues_count, :owner_login, :pushed_at, :watchers_count
  has_many :lists, :through => :listings

  def lookup
  	full_name
  	gh = Github.repos.get owner_login, name 
  end

end
