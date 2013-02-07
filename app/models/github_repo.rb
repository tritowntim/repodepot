class GithubRepo

  attr_reader :owner, :repo_name, :gh, :repository, :input

  def initialize(input)
    @input = input
    create_repo if valid_input?
  end

  def valid_input?  
    full_repo_name = @input.gsub("https://github.com/","")
    if full_repo_name.count("/") == 1
      repo_ids = full_repo_name.split("/")
      @owner, @repo_name = repo_ids[0], repo_ids[1]
      if @owner && @owner.length > 0 && @repo_name && @repo_name.length > 0
        true
      else
        raise_invalid_input_format 
      end
    else 
      raise_invalid_input_format  
    end
  end 

  def raise_invalid_input_format
    raise ArgumentError, "Repository name/URL of '#{@input}' has incorrect format; see examples below"
  end

  def lookup

    # todo: replace with OAuth somehow, and/or use logged-in user's account for API calls
    begin
      github = Github.new :login => ENV['GITHUB_USERNAME'], :password => ENV['GITHUB_PASSWORD']
      @gh = github.repos.get @owner, @repo_name 
      puts "GitHub API Rate Limit: remaining API calls allowed = #{@gh.ratelimit_remaining}"

    rescue Github::Error::NotFound => e
      raise ArgumentError, "GitHub repository '#{@input}' not found "
    end  
  end 

  def create_repo

      @repository = Repository.new
      @repository.owner_login = @owner
      @repository.name = @repo_name

      lookup

      # todo: easier way to write with block?
      @repository.github_id = @gh.id
      @repository.full_name = @gh.full_name
      @repository.gh_created_at = @gh.created_at
      @repository.gh_updated_at = @gh.updated_at
      @repository.pushed_at = @gh.pushed_at
      @repository.watchers_count = @gh.watchers_count
      @repository.forks_count = @gh.forks_count
      @repository.open_issues_count = @gh.open_issues_count
      @repository.network_count = @gh.network_count
      @repository.language = @gh.language
      @repository.description = @gh.description
      @repository.clone_url = @gh.clone_url
      @repository.html_url = @gh.html_url

      @repository.save
      @repository  

    end

end