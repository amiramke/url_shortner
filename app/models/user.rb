class User < ActiveRecord::Base
 attr_accessor :password, :password_confirmation
  attr_accessible :username, :email, :password, :password_confirmation, :encrypted_password 
  
#  has_secure_password

  has_many :urls

  validates :email, :presence => true, :uniqueness => true

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  
  def clear_password
    self.password = nil
  end


  def self.authenticate(email, password)
    user = find_by_email(email)
    if self.encrypted_password == BCrypt::Engine.hash_secret(password, salt)
      user
    else
      false
    end
  end
  
#  def encrypt_password
#    if password.present?
#      self.password_salt = BCrypt::Engine.generate_salt
#      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
#    end
#  end

end
