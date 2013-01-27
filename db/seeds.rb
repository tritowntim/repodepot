# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# REPODEPOT STACK LIST ######################

list_repodepot = List.create!(:title => "RepoDepot Application Stack", :description => "All repos used to build RepoDepot, including the app itself.")

repo_repodepot = GithubRepo.new("https://github.com/tritowntim/repodepot").repository
repo_repodepot.save!
repo_rails = GithubRepo.new("https://github.com/rails/rails").repository
repo_rails.save!
repo_jquery = GithubRepo.new("https://github.com/jquery/jquery").repository
repo_jquery.save!
repo_gh_api = GithubRepo.new("https://github.com/peter-murach/github").repository
repo_gh_api.save!


listing_repodepot_self = Listing.create!(:list_id => list_repodepot.id, :repository_id => repo_repodepot.id, :commentary => "The code base for this app.", :ordering => 1)
listing_repodepot_rails = Listing.create!(:list_id => list_repodepot.id, :repository_id => repo_rails.id, :commentary => "RepoDepot is a Rails application.", :ordering => 2)
listing_repodepot_jquery = Listing.create!(:list_id => list_repodepot.id, :repository_id => repo_jquery.id, :commentary => "Like most Rails 3 apps, RepoDepot uses JQuery.", :ordering => 3)
listing_repodepot_gh_api = Listing.create!(:list_id => list_repodepot.id, :repository_id => repo_gh_api.id, :commentary => "Ruby gem for accessing GitHub API.", :ordering => 4)


# LINKED IN LIST ######################

list_li = List.create!(:title => "LinkedIn Client-Side Templating Throwdown", :description => "LinkedIn evaluation of 18 different client-side Javascript templating solutions.  Article here: http://engineering.linkedin.com/frontend/client-side-templating-throwdown-mustache-handlebars-dustjs-and-more These three projects were not hosted on GitHub: KiTE http://code.google.com/p/kite/ Google Closure Templates https://developers.google.com/closure/templates/ EJS http://embeddedjs.com/ ")

i = 0
repos_li = ["https://github.com/documentcloud/underscore", "https://github.com/visionmedia/jade", "https://github.com/creationix/haml-js", "https://github.com/aefxx/jQote2", "https://github.com/olado/doT", "https://github.com/thetalecrafter/stencil", "https://github.com/ollym/parrot", "https://github.com/sstephenson/eco", "https://github.com/jquery/jquery-tmpl", "https://github.com/cramforce/node-asyncEJS", "https://github.com/janl/mustache.js", "https://github.com/akdubya/dustjs", "https://github.com/wycats/handlebars.js", "https://github.com/akaspin/nun", "https://github.com/raycmorgan/Mu"].each do |url| 
	repo_li = GithubRepo.new(url).repository
	repo_li.save!

  i += 1
  listing_li = Listing.create!(:list_id => list_li.id, :repository_id => repo_li.id, :commentary => "", :ordering => i)

end


# RAILS ALTERNATIVES ##############

list_alt = List.create!(:title => "Ruby Web Alternatives to Rails", :description => "Other Ruby frameworks besides Rails.")

i = 0
repos_alt = ["https://github.com/sinatra/sinatra", "https://github.com/padrino/padrino-framework", "https://github.com/camping/camping", "https://github.com/ramaze/ramaze", "https://github.com/renee-project/renee",  "https://github.com/mtodd/halcyon", "https://github.com/mikbe/blast"].each do |url| 
	repo_alt = GithubRepo.new(url).repository
	repo_alt.save!

  i += 1
  listing_alt = Listing.create!(:list_id => list_alt.id, :repository_id => repo_alt.id, :commentary => "", :ordering => i)

end
 
 



 
# ToDo: remove, reference from Rails Recipes book
# chad = Person.create!(:name => "Chad", :location => "Boulder, CO") 
# rich = Person.create!(:name => "Rich", :location => "Reston, VA")
# %w(Shrenik Arnie Polkadot).each do |pet_name| chad.pets.create!(:name => pet_name)
# end
# rich.pets.create!(:name => "Ewok")
