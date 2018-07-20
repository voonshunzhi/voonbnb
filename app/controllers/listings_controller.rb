class ListingsController < ApplicationController
	before_action :require_login
	before_action :find_listing, only: [:edit,:destroy]

	def index
		@listings = current_user.listings.paginate(page:params[:page],per_page:6)
	end
	
	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_param)
		@listing.user = current_user
		if @listing.save 
			flash[:success] = "Your Airbnb is successfully listed."
			redirect_to listings_path
		else
			flash[:danger] = "There are errors preventing the airbnb from being saved."
			redirect_to listings_path
		end
	end

	def edit
	end

	def destroy
		@id = @listing.id
		@listing.delete
		respond_to do |format|
			format.js { render "admins/destroy"}
		end
	end

	def update
		@listing = Listing.find(params[:id])
		@listing.update(listing_param)
		@listings = current_user.listings.paginate(page:params[:page],per_page:6)
		flash.now[:success] = "Your Airbnb is successfully updated."
		render "listings/index"
	end

	def income
		@listings = current_user.listings
		@listing_ids = @listings.collect {|listing| listing.id}
		@objectss = Reservation.where(listing_id:@listing_ids)
		@objects = Reservation.where(listing_id:@listing_ids).paginate(page:params[:page],per_page:5)
		@income = @objectss.sum(:total_price)
	end

	private
	def find_listing
		@listing = Listing.find(params[:id])
	end
	def listing_param
		params.require(:listing).permit(:name, 
			:num_of_beds, :price_per_night,:num_of_bath,:num_of_rooms,:country,:state,:city,:resident,:poscode,:street,
			:house_number,:sort_id,{image: []},amenities: [])
	end
end
