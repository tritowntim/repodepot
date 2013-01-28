class GithubRepo

  attr_reader :owner, :repo_name, :gh, :repository

  def initialize(input)
    create_repo if validate(input) 
  end

  def validate(input) 
    full_repo_name = input.gsub("https://github.com/","")
    if full_repo_name.count("/") == 1
      # repo_ids = input[19,input.length-1].split("/")
      repo_ids = full_repo_name.split("/")
      @owner, @repo_name = repo_ids[0], repo_ids[1]
      @owner.length > 0 && @repo_name.length > 0 
    else 
      false
    end
    # todo: throw error if invalid
   end 

  def lookup 
    begin
      # todo: replace with OAuth somehow, and/or use user's account 
      github = Github.new :login => ENV['GITHUB_USERNAME'], :password => ENV['GITHUB_PASSWORD']
      @gh = github.repos.get @owner, @repo_name 
      puts "RATE LIMIT REMAINING = " + @gh.ratelimit_remaining
      true
    rescue Github::Error::NotFound => e
      puts "GHERROR = " + e.message
      false
    end  
  end 

  def create_repo

      @repository = Repository.new
      @repository.owner_login = @owner
      @repository.name = @repo_name

      if lookup

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
      else
        nil
      end

    end

end