class Beer < ActiveRecord::Base
  attr_accessible :name, :brewery

  has_and_belongs_to_many :pubs
  belongs_to :brewery

  validates :name, :length => { :minimum => 1 }


end
