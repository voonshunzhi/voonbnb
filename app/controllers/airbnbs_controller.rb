class AirbnbsController < ApplicationController
	before_action :require_login, only: [:index]
	def index
		@listings = Listing.where(status:"approved").order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
	end
	def show
		@airbnb = Listing.find(params[:id])
		@reservation = Reservation.new
		@disabled_dates = Reservation.where(listing_id:params[:id])
		range_of_occupied_dates
	end

	def user_airbnbs
		@airbnbs = User.find(params[:id]).listings
	end
end
