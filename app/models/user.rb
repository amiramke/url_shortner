class User < ActiveRecord::Base
  has_many :urls
  attr_accessible :name, :email

  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true

end
