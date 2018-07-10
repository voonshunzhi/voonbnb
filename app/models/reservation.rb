class Reservation < ApplicationRecord
	enum payment_status:[:not_paid,:paid]
end
