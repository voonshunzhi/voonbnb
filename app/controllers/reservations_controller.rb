class ReservationsController < ApplicationController
	
	def index
		@reservations = current_user.reservations
	end
	
	def show
	end

	def create
		@reservation = Reservation.new(reserve_params)
		@reservation.user = current_user
		@reservation.listing_id = params[:airbnb_id]
		
		if @reservation.save
			flash[:success] = "You have successfully reserved the Airbnb."
			redirect_to reservations_path
		else
			flash[:danger] = "Please choose your check-in and check-out date!"
			redirect_to airbnb_path(@reservation.listing)
		end
	end

	private
	def reserve_params
		params.require(:reservation).permit(:check_in_date,:check_out_date)
	end
end
