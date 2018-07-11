module ListingsHelper
	def find_reservation(id)
		Reservation.find_by(listing_id:id)
	end
end
