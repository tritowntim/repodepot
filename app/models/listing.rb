class Listing < ActiveRecord::Base
  attr_accessible :commentary, :list_id, :ordering, :repository_id, :list, :repository
  belongs_to :list
  belongs_to :repository
end
