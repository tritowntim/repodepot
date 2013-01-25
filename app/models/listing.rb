class Listing < ActiveRecord::Base
  attr_accessible :commentary, :list_id, :ordering, :repository_id
  belongs_to :list
  belongs_to :repository
end
