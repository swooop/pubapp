require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :name_first, :name_last, :password, :password_confirmation

  has_secure_password

  has_many :visits
  has_many :pubs, :through => :visits

  validates :email, :presence => true
  validates :email, :uniqueness => true

  validates_presence_of :password, :on => :create

  before_validation :downcase_email
  
  def downcase_email
    self.email.downcase!
  end

end   

