class Pub < ActiveRecord::Base
  attr_accessible :name, :breweries, :location, :beers

  has_many :visits
  has_many :users, :through => :visits
  has_and_belongs_to_many :beers
  has_and_belongs_to_many :breweries
  belongs_to :location

end
