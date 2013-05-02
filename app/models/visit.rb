class Visit < ActiveRecord::Base
  attr_accessible :visited_on, :user, :pub

  belongs_to :user
  belongs_to :pub
end
