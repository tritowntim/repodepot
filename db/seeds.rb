# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

repo_repodepot = GithubRepo.new("https://github.com/tritowntim/repodepot").repository
repo_repodepot.save!
repo_rails = GithubRepo.new("https://github.com/rails/rails").repository
repo_rails.save!
repo_jquery = GithubRepo.new("https://github.com/jquery/jquery").repository
repo_jquery.save!

list_repodepot = List.create!(:title => "RepoDepot Application Stack", :description => "All repos used to build RepoDepot, including the app itself.")
listing_repodepot_self = Listing.create!(:list => list_repodepot, :repository => repo_repodepot, :commentary => "The code base for this app.", :ordering => 1)
listing_repodepot_rails = Listing.create!(:list => list_repodepot, :repository => repo_rails, :commentary => "RepoDepot is a Rails application.", :ordering => 2)
listing_repodepot_jquery = Listing.create!(:list => list_repodepot, :repository => repo_jquery, :commentary => "Like most Rails 3 apps, RepoDepot uses JQuery.", :ordering => 3)

# listing_repodepot_self = Listing.create!(:list => list_repodepot, :repository => repo_repodepot, :commentary => "The code base for this app.", :ordering => 1)
# listing_repodepot_rails = Listing.create!(:list => list_repodepot, :repository => repo_rails, :commentary => "RepoDepot is a Rails application.", :ordering => 2)
# listing_repodepot_jquery = Listing.create!(:list => list_repodepot, :repository => repo_jquery, :commentary => "Like most Rails 3 apps, RepoDepot uses JQuery.", :ordering => 3)


# chad = Person.create!(:name => "Chad", :location => "Boulder, CO") 
# rich = Person.create!(:name => "Rich", :location => "Reston, VA")
# %w(Shrenik Arnie Polkadot).each do |pet_name| chad.pets.create!(:name => pet_name)
# end
# rich.pets.create!(:name => "Ewok")
