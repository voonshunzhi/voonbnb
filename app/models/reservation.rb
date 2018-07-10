class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	#before_save :check_in_date_print
	validates :check_out_date,presence:true
	validates :check_in_date,presence:true
	enum payment_status:{"Not Paid" => 0,"Paid"=> 1}

	# def check_in_date_print
	# 	p self.check_in_date
	# end

end
