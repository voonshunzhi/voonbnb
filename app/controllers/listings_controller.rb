class ListingsController < ApplicationController
	before_action :require_login
	before_action :find_listing, only: [:edit,:destroy]

	def index
		@listings = current_user.listings
	end
	def new
		@listing = Listing.new
	end
	def create
		@listing = Listing.new(listing_param)
		@listing.user = current_user
		@listing.save 
		flash[:success] = "Your Airbnb is successfully listed."
		redirect_to listings_path
	end

	def edit
	end

	def destroy
		@listing.delete
		flash[:success] = "Your Airbnb is successfully deleted."
		redirect_to listings_path
	end

	def update
		@listing = Listing.find(params[:id])
		@listing.update(listing_param)
		flash[:success] = "Your Airbnb is successfully updated."
		redirect_to listings_path
	end
	private
	def find_listing
		@listing = Listing.find(params[:id])
	end
	def listing_param
		params.require(:listing).permit(:name, 
			:num_of_beds, :price_per_night,:num_of_bath,:num_of_rooms,:country,:state,:city,:resident,:poscode,:street,
			:house_number,:sort_id,:remove_image,{image: []},{amenities: []})
	end
end