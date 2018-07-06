class PagesController < ApplicationController
	before_action :require_login, only: [:new,:all]
	def index
	end
end
