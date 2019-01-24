class ShortenedUrl < ApplicationRecord 

  validates :long_url, presence: true, uniqueness: true 
  
  belongs_to :user,
     primary_key: :id,
     foreign_key: :user_id,
     class_name: :User 
    

  def self.random_code
    random = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(short_url: random)
      random = SecureRandom.urlsafe_base64
    end  
    random 
  end 

  def self.create!(user, long_url)
    ShortenedUrl.new(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
  end 
end 