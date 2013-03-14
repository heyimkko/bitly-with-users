require 'securerandom'
require 'digest'
class User < ActiveRecord::Base
  has_many :urls
  
  VALID_EMAIL_REGEX = /(\S{2,}@\S*\S.(com|net|me|org))/
  before_save :create_remember_token
  before_save :encrypt_password
  validates :email, :format => {:with => VALID_EMAIL_REGEX}
  validates :email, :uniqueness => true

  def create_remember_token
    self.remember_token = SecureRandom.hex[0..5]
  end

  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end

  def authenticate(password)
    encrypt_password == self.password
  end
end
