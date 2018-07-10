class ReservationsController < ApplicationController
	# def create
	# 	reservation = Reservation.new(reserve_params)
	# 	reservation.user = current_user
	# 	reservation.listing = params[:id]
	# 	reservation.save
	# 	flash[:success] = "Your booking is successful."
	# 	redirect_to 
	# end
	def create
		render "airbnbs/show"
	end

	private
	def reserve_params
		params.require(:reservation).permit(:check_in_date,:check_out_date)
	end
end
