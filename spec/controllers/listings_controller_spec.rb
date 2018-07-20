require 'rails_helper'

RSpec.describe ListingsController do
	describe "GET #new" do
		it "has no problem getting new path" do
			get :new
			expect(response).to be_success #response.success?
		end
	end

	# context "POST #" do
	# end
end
