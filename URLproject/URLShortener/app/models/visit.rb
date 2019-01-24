class Visit < ApplicationRecord 
  belongs_to :users,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 

    
  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user.id, shortened_url_id: shortened_url.id)
  end 
end 