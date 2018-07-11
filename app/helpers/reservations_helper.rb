module ReservationsHelper
	def num_of_days(hash)
		days = hash[:check_out_date].to_date - hash[:check_in_date].to_date
		days > 0 ? days : nil
	 end

	def total_price(reservation)
		total_price = reservation.days * reservation.listing.price_per_night
		total_price
	end

end
