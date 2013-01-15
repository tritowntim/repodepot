


class RepositoriesController < ApplicationController
  def new
  	@repository = Repository.new  	
  end

  def create
    # owner_login, repo_name = params[:owner_login], params[:repo_name]
  	
  	@repository = Repository.new(params[:repository])
  	puts "input = #{@repository.owner_login} #{@repository.name}"
		gh = Github.repos.get @repository.owner_login, @repository.name
		
		# todo: easier to write with block?
		@repository.github_id = gh.id
		@repository.full_name = gh.full_name
		@repository.gh_created_at = gh.created_at
		@repository.gh_updated_at = gh.updated_at
		@repository.pushed_at = gh.pushed_at
		@repository.watchers_count = gh.watchers_count
		@repository.forks_count = gh.forks_count
		@repository.open_issues_count = gh.open_issues_count
		@repository.network_count = gh.network_count
		@repository.language = gh.language
		@repository.description = gh.description
		@repository.clone_url = gh.clone_url
		@repository.html_url = gh.html_url

		@repository.save

		redirect_to @repository
  end

  def show
  	@repository = Repository.find(params[:id])
  end

  def index
  	@repositories = Repository.all
  end
end
