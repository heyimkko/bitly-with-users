class Url < ActiveRecord::Base
  belongs_to :user
  
  before_save :create_short_url
  validates :long_url, :presence => true
  validates :long_url, :format => { :with => (/http:\/\/www.\S*\.\S*/) }
  private

  def create_short_url
    self.short_url = SecureRandom.hex[0..5] if self.short_url.nil?
  end

end
