require 'spec_helper'

require_relative '../../app/models/github_repo'

describe "GithubRepo" do 
	
	describe "create new repo" do

		it "returns new repository" do

			gh = GithubRepo.new("https://github.com/twitter/bootstrap")
			repo = gh.repository
			expect(repo.full_name).to eq "twitter/bootstrap"
			expect(repo.github_id).to eq 2126244

		end
	end
end