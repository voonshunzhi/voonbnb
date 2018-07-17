class AdminsController < ApplicationController
	before_action :is_admin?,only:[:index,:update]
	before_action :find_listing,only:[:update,:destroy]

	def index
		@listings = Listing.paginate(page:params[:page],per_page:10)
	end
	def update
		@listing.update(status:"approved")
		respond_to do |format|
			format.js 
		end
	end

	def destroy
		@listing.delete
		redirect_to admins_path
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
