class User < ApplicationRecord
 include Clearance::User
 has_many :authentications, dependent: :destroy
 has_many :listings,dependent: :destroy
 has_many :reservations,dependent: :destroy
 mount_uploader :image, ImageUploader

 def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     username: auth_hash["info"]["name"],
     email: auth_hash["info"]["email"],
     image: auth_hash["info"]["picture"],
     password: SecureRandom.hex(10)
   )
   user.authentications << authentication
   return user
 end

 # grab google to access google for user data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end
end