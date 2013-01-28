class List < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :listings_attributes
  has_many :listings, :order => "ordering"
  has_many :repositories, :through => :listings
  belongs_to :user

  validates_presence_of :title, :message => "cannot be blank"
  validates_presence_of :description, :message => "cannot be blank"
  
  # this line would not work with custom error message, hence validates_presence_of
  # validates :description, {:presence => true, :message => "cannot be blank"}
  
  accepts_nested_attributes_for :listings, :allow_destroy => true
end
