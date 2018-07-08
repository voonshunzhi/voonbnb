class AirbnbsController < ApplicationController
	before_action :require_login, only: [:index]
	def index
		@listings = Listing.where(status:"approved")
	end
end
