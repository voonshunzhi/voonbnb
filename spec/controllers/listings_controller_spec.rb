require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
	context "GET #new" do
		it "has no problem, getting new path" do
			get :new
			expect(response).to be_success
		end
	end
end
