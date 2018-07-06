class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy

  	#At the user model,since we don't want to take all the data we receive from the auth_hash, we customise a new method to put data
  	#into the database
	def self.create_with_auth_and_hash(authentication, auth_hash)
	user = self.create!(
	 username: auth_hash["info"]["name"],
	 email: auth_hash["info"]["email"],
	 picture:auth_hash["info"]["picture"],
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
