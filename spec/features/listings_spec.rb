require 'rails_helper'

RSpec.feature "Listings", type: :feature do
  context "create new listing" do

  	before(:each) do
  		
  	end

  	scenario "should be successful" do
  		User.create!(username:"bongbong",email:"bong@gmail.com",password:"93332030")
  		Sort.create!(sort:"apartment")
  		visit new_listing_path

  		within('form') do #within form html tag
		fill_in "listing[name]",with:"The James Treehouse"
		fill_in "listing[price_per_night]",with:130
  		end
  		click_on 'List !'
  		expect(page).to have_content("successfully")
  	end

  	# scenario "should fail" do
  	# 	User.create!(username:"bongbong",email:"bong@gmail.com",password:"93332030")
  	# 	Sort.create!(sort:"apartment")
  	# 	visit new_listing_path
  	# 	within('form') do
  	# 		fill_in "The Name of Airbnb :",with:" "
  	# 		fill_in "Price per night :",with:" "
  	# 	end
  	# 	click_on "List !"
  	# 	expect(page).to have_content("There are errors preventing the airbnb from being saved.")

  	# end
  end


end
