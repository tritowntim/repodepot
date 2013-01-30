require 'spec_helper'

require_relative '../../app/models/github_repo'

describe "GithubRepo" do 

	gh = nil
	before(:all) { gh = GithubRepo.new("https://github.com/twitter/bootstrap") }

	describe "create new repo" do

		it "creates new repository record" do
			repo = gh.repository
			expect(repo.full_name).to eq "twitter/bootstrap"
			expect(repo.github_id).to eq 2126244
		end

		it "validates valid repo name input" do 
			expect(gh.validate("twitter/bootstrap")).to eq true
		end

		it "finds invalid repo name input" do 
			expect {gh.validate("twitter bootstrap")}.to raise_error(ArgumentError)
		end

		it "validates URL input" do 
			expect(gh.validate("https://github.com/twitter/bootstrap")).to eq true
		end

		it "finds invalid URL input" do 
			expect {gh.validate("https://gh.com/twitter/bootstrap")}.to raise_error(ArgumentError)
		end

		it "handles repo-not-found gracefully" do 
			repo = GithubRepo.new("twitter/facebook")
			expect(repo.repository.id).to eq nil
			expect(repo.repository.github_id).to eq nil
		end

	end
end