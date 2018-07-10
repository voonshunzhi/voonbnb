module AirbnbsHelper
	def host_name
		@airbnb.user.username
	end

	def range_of_occupied_dates
		@range = []
		@disabled_dates.each do |reserve|
			@range.concat (reserve.check_in_date.to_date..reserve.check_out_date.to_date).map{ |date| date.strftime("%Y-%m-%d") }
		end
		@range
	end
end
