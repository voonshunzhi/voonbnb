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
		if helpers.num_of_days(reserve_params)
			@reservation.days = helpers.num_of_days(reserve_params)
			@reservation.total_price = helpers.total_price(@reservation)
			if @reservation.save
				flash[:success] = "You have successfully reserved the Airbnb."
				redirect_back
			else
				flash[:danger] = "Please choose your check-in and check-out date!"
				redirect_back
			end
		else
			flash[:danger] = "Please select a valid check-in-date and check-out-date!"
			redirect_back
		end
		
	end

	private
	def reserve_params
		params.require(:reservation).permit(:check_in_date,:check_out_date)
	end
end
