require 'spec_helper'

require_relative '../../app/models/github_repo'

describe "GithubRepo" do  

	describe "create new repo" do

		it "builds new repository model with URL" do
			repo = GithubRepo.new("https://github.com/twitter/bootstrap").repository
			expect(repo.full_name).to eq "twitter/bootstrap"
			expect(repo.github_id).to eq 2126244
		end 

		it "builds new repository model with repo name" do
			repo = GithubRepo.new("jquery/jquery").repository
			expect(repo.full_name).to eq "jquery/jquery"
			expect(repo.github_id).to eq 167174
		end 

		it "errors for invalid input format for URL" do 
			# http instead of https
			expect {GithubRepo.new("http://github.com/twitter/bootstrap")}.to raise_error(ArgumentError)
		end 

		it "errors for invalid input format for repo name" do 
			expect {GithubRepo.new("twitter bootstrap")}.to raise_error(ArgumentError)
		end

		it "errors on GitHub 404 for URL" do 
			expect {GithubRepo.new("http://github.com/rails/rails3")}.to raise_error(ArgumentError)
		end

		it "errors on GitHub 404 for repo name" do 
			expect {GithubRepo.new("rails/rails4")}.to raise_error(ArgumentError)
		end

	end
end