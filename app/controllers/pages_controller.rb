class PagesController < ApplicationController
	before_action :require_login, only: [:new,:all]
	def index
		@listings = Listing.where(status:"approved")
	end
end
