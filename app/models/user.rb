require 'securerandom'
require 'digest'
class User < ActiveRecord::Base

  before_save :create_remember_token
  before_save :encrypt_password

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
