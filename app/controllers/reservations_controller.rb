class ReservationsController < ApplicationController
	
	def index
		@reservations = current_user.reservations.paginate(page:params[:page],per_page:5)
	end
	
	

	
end
