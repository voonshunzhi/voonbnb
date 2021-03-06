class AdminsController < ApplicationController
	before_action :is_admin?,only:[:index,:update]
	before_action :find_listing,only:[:update,:destroy]

	def index
		@listings = Listing.all
	end
	def update
		@listing.update(status:"approved")
		respond_to do |format|
			format.js 
		end
	end

	def destroy
		@id = @listing.id
		@listing.delete
		respond_to do |format|
			format.js 
		end
	end

	private
	def find_listing
		@listing = Listing.find(params[:id])
	end
	def is_admin?
		if current_user.role != "admin"
			redirect_to signed_in_root_path
		end
	end
end
