class Listing < ActiveRecord::Base
  attr_accessible :commentary, :list_id, :ordering, :repository_id
  belongs_to :list
  belongs_to :repository

  validates :repository_id, :uniqueness => { :scope => :list_id, :message => ": This list now has a repository listed more than once. Remove the duplicate in order to save this list." }
end
