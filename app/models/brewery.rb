class Brewery < ActiveRecord::Base
  attr_accessible :name, :beers

  has_many :beers
  has_and_belongs_to_many :pubs
end
