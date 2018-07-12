class TransactionsController < ApplicationController

	def new
	 	@reservation = Reservation.new(reserve_params)
		@reservation.user = current_user
		if helpers.num_of_days(reserve_params) && overlap?(reserve_params)
			@reservation.days = helpers.num_of_days(reserve_params)
			@reservation.total_price = helpers.total_price(@reservation)
			@client_token = Braintree::ClientToken.generate
		else
			flash[:danger] = "Please select a valid check-in-date and check-out-date!"
			redirect_to airbnb_path(@reservation.listing)
		end
	end

	  def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  @price = params[:checkout_form][:price]
	  result = Braintree::Transaction.sale(
	   :amount => @price, #this is currently hardcoded
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	  	@reservation = Reservation.new(check_out_date:params[:checkout_form][:out],check_in_date:params[:checkout_form][:in],listing_id:params[:checkout_form][:list],user_id:params[:checkout_form][:user],
	  		total_price:@price,days:params[:checkout_form][:days])
	  	@reservation.save
	  	UserMailer.booking_confirmation(@reservation).deliver_now
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :danger => "Transaction failed. Please try again." }
	  end
	end


	private
	def reserve_params
		params.require(:reservation).permit(:check_in_date,:check_out_date,:listing_id)
	end

	def overlap?(hash)
		reservations = Reservation.where(listing_id:hash[:listing_id])
		reservations.each do |reservation|
			if (hash[:check_in_date].to_date - reservation.check_out_date) * (reservation.check_in_date - hash[:check_out_date].to_date) > 0 
				false 
				break
			else	
				true
			end
		end
	end

	#(x.first - y.end) * (y.first - x.end) > 0
end
