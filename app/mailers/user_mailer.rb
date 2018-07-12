class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end

	def booking_confirmation(reservation)
		@reservation = reservation
		mail(to: @reservation.user.email, subject: 'You booking confirmation for Airbnb!')
	end
end
