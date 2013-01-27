class RepositoriesController < ApplicationController   

  respond_to :html, :js

  # def new
  # 	@repository = Repository.new  	
  # end

  # def create
  	
  # 	@repository = Repository.new(params[:repository])
  # 	puts "input = #{@repository.owner_login} #{@repository.name}"

		# redirect_to create_from_api @repository.owner_login, @repository.name
  # end

  def show
  	@repository = Repository.find(params[:id]) 
  end

  def index
  	@repositories = Repository.all
  end

  def search
  	# todo: avoid usage of dummy repo...  form_tag?
  	@repository = Repository.new
  end

  def lookup

    @existing = Repository.where("full_name = ?", params[:full_repo_name]).first

    logger.info("EXISTING = #{@existing ? @existing.full_name : 'NOT FOUND'}")

    if @existing == nil 
      @repository = GithubRepo.new(params[:full_repo_name]).repository
    else
    	@repository = @existing
    end

    if (@repository.full_name == nil )
      respond_to do |format|
        format.html 
        format.js { render :action => :search}
      end 
    else    
      respond_to do |format|
        format.html 
        format.js
      end 
    end
  end

  # private

  #   def create_from_api(owner_login, repo_name)

  #   	@repository = Repository.new
  #   	@repository.owner_login = owner_login
  #   	@repository.name = repo_name

	 #  	# todo: move Github API access and mapping to dedicated object 
		# 	gh = Github.repos.get owner_login, repo_name 

		# 	# todo: easier way to write with block?
		# 	@repository.github_id = gh.id
		# 	@repository.full_name = gh.full_name
		# 	@repository.gh_created_at = gh.created_at
		# 	@repository.gh_updated_at = gh.updated_at
		# 	@repository.pushed_at = gh.pushed_at
		# 	@repository.watchers_count = gh.watchers_count
		# 	@repository.forks_count = gh.forks_count
		# 	@repository.open_issues_count = gh.open_issues_count
		# 	@repository.network_count = gh.network_count
		# 	@repository.language = gh.language
		# 	@repository.description = gh.description
		# 	@repository.clone_url = gh.clone_url
		# 	@repository.html_url = gh.html_url

		# 	@repository.save
		# 	@repository
  #   end
end
