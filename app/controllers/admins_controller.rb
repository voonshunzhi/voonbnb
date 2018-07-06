class AdminsController < ApplicationController
	before_action :is_admin?,only:[:index,:approve]

	def index
		@listings = Listing.all
	end
	def approve
		@listing = Listing.find(params[:id])
		@listing.update(status:"approved")
		redirect_to admin_index_path
	end
	def destroy
		@listing = Listing.find(params[:id])
		@listing.delete
		redirect_to admin_index_path
	end

	private
	def is_admin?
		if current_user.role != "admin"
			redirect_to root_path
		end
	end
end
