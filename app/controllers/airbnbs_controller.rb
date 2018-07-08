class AirbnbsController < ApplicationController
	before_action :require_login, only: [:index]
	def index
		@listings = Listing.where(status:"approved").paginate(:page => params[:page], :per_page => 12)
	end
	def show
		@airbnb = Listing.find(params[:id])
	end
end
