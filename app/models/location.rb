class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude, :pubs
  has_many :pubs
  
  

  geocoded_by :address
  after_validation :geocode
end
