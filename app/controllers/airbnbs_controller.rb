class AirbnbsController < ApplicationController
	before_action :require_login, only: [:index]
	def index
		@listings = Listing.where(status:"approved").order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
	end
	def show
		@airbnb = Listing.find(params[:id])
		@reservation = Reservation.new
		@disabled_dates = Reservation.where(listing_id:params[:id])
		@range = []
		@disabled_dates.each do |reserve|
			@range.concat (reserve.check_in_date.to_date..reserve.check_out_date.to_date).map{ |date| date.strftime("%Y-%m-%d") }
		end
	end

	def user_airbnbs
		@airbnbs = User.find(params[:id]).listings
	end
end
