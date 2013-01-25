class List < ActiveRecord::Base
  attr_accessible :title, :description, :listings_attributes
  has_many :listings, :order => "ordering"
  has_many :repositories, :through => :listings

  accepts_nested_attributes_for :listings, :allow_destroy => true
end
