class List < ActiveRecord::Base
  attr_accessible :description, :title, :listings_attributes
  has_many :listings
  has_many :repositories, :through => :listings

  accepts_nested_attributes_for :listings, :allow_destroy => true
end
