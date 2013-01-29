# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


################# DEFAULT/EXAMPLE USER #############################

example = User.new
example.provider = "none (seeded)"
example.name = "example"
example.save

################# REPODEPOT STACK LIST ######################

list_repodepot = List.create!(:title => "RepoDepot Application Stack", :description => "All repos used to build RepoDepot, including the app itself.", :user_id => example.id)

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


################# LINKED IN LIST ######################

list_li = List.create!(:title => "LinkedIn Client-Side Templating Throwdown", :description => "LinkedIn evaluation of 18 different client-side Javascript templating solutions.  Article here: http://engineering.linkedin.com/frontend/client-side-templating-throwdown-mustache-handlebars-dustjs-and-more These three projects were not hosted on GitHub: KiTE http://code.google.com/p/kite/ Google Closure Templates https://developers.google.com/closure/templates/ EJS http://embeddedjs.com/", :user_id => example.id)

i = 0
repos_li = ["https://github.com/documentcloud/underscore", "https://github.com/visionmedia/jade", "https://github.com/creationix/haml-js", "https://github.com/aefxx/jQote2", "https://github.com/olado/doT", "https://github.com/thetalecrafter/stencil", "https://github.com/ollym/parrot", "https://github.com/sstephenson/eco", "https://github.com/jquery/jquery-tmpl", "https://github.com/cramforce/node-asyncEJS", "https://github.com/janl/mustache.js", "https://github.com/akdubya/dustjs", "https://github.com/wycats/handlebars.js", "https://github.com/akaspin/nun", "https://github.com/raycmorgan/Mu"].each do |url| 
	repo_li = GithubRepo.new(url).repository
	repo_li.save!

  i += 1
  listing_li = Listing.create!(:list_id => list_li.id, :repository_id => repo_li.id, :commentary => "", :ordering => i)

end


################# RAILS ALTERNATIVES ##############

list_alt = List.create!(:title => "Ruby Web Alternatives to Rails", :description => "Other Ruby frameworks besides Rails.", :user_id => example.id)

i = 0
repos_alt = ["https://github.com/sinatra/sinatra", "https://github.com/padrino/padrino-framework", "https://github.com/camping/camping", "https://github.com/ramaze/ramaze", "https://github.com/renee-project/renee",  "https://github.com/mtodd/halcyon", "https://github.com/mikbe/blast"].each do |url| 
	repo_alt = GithubRepo.new(url).repository
	repo_alt.save!

  i += 1
  listing_alt = Listing.create!(:list_id => list_alt.id, :repository_id => repo_alt.id, :commentary => "", :ordering => i)

end


################# TRELLO STACK ########################
 
list_trello = List.create!(:title => "The Trello Stack", :description => "Libraries used to create the Trello application at http://trello.com.  Based on this blog post: http://blog.fogcreek.com/the-trello-tech-stack/ Note that HAProxy is not hosted on GitHub, but instead here http://haproxy.1wt.eu/", :user_id => example.id)

i = 0
repos_trello = []
repos_trello << "https://github.com/jashkenas/coffee-script"
repos_trello << "https://github.com/documentcloud/backbone"
repos_trello << "https://github.com/pvande/Milk"
repos_trello << "https://github.com/LearnBoost/socket.io"
repos_trello << "https://github.com/joyent/node"
repos_trello << "https://github.com/mongodb/node-mongodb-native"
repos_trello << "https://github.com/LearnBoost/mongoose"
repos_trello << "https://github.com/visionmedia/express"
repos_trello << "https://github.com/senchalabs/connect"
repos_trello << "https://github.com/learnboost/cluster"
repos_trello << "https://github.com/mranney/node_redis"
repos_trello << "https://github.com/caolan/async"
repos_trello << "https://github.com/antirez/redis"
repos_trello << "https://github.com/mongodb/mongo"
repos_trello.each do |url| 
	repo_trello = GithubRepo.new(url).repository
	repo_trello.save!

  i += 1
  listing_trello = Listing.create!(:list_id => list_trello.id, :repository_id => repo_trello.id, :commentary => "", :ordering => i)

end

i += 1
listing_trello_jq = Listing.create!(:list_id => list_trello.id, :repository_id => repo_jquery.id, :commentary => "", :ordering => i)




 
# ToDo: remove, reference from Rails Recipes book
# chad = Person.create!(:name => "Chad", :location => "Boulder, CO") 
# rich = Person.create!(:name => "Rich", :location => "Reston, VA")
# %w(Shrenik Arnie Polkadot).each do |pet_name| chad.pets.create!(:name => pet_name)
# end
# rich.pets.create!(:name => "Ewok")
