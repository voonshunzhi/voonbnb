class ListingsController < ApplicationController
	before_action :require_login
	def index
		@listings = Listing.all
	end
	def new
		@listing = Listing.new
	end
	def create
		@listing = Listing.new(listing_param)
		@listing.save 
		redirect_to listings_path
	end
	def edit
		@listing = Listing.find(params[:id])
	end
	private
	def listing_param
		params.require(:listing).permit(:name, 
			:num_of_beds, :price_per_night,:num_of_bath,:num_of_rooms,:wifi,:kitchen,:washer,:dryer,:iron,:hair_dryer,:country,:state,:city,:resident,:poscode,:street,
			:house_number,:user_id,:sort_id,{image: []})
	end
end
