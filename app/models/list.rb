class List < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :listings
  has_many :repositories, :through => :listings
end
