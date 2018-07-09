module UsersHelper
	def num_of_listing
		pluralize(@user.listings.count,'listing')
	end
	def own?
		if current_user.id == @user.id 
			true
		else
			false
		end
	end
end