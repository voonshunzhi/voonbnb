class PagesController < ApplicationController
	#Things to check before going into action
	before_action :require_login, only: [:profile]

	def profile
		@user = User.find(current_user.id)
	end

end
