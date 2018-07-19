require 'rails_helper'

RSpec.describe Listing, type: :model do
  context "validation test" do
  	
  	it "has one sort's name" do
	    assc = described_class.reflect_on_association(:sort)
	    expect(assc.macro).to eq :belongs_to
  	end
  	it "has one sort's name" do
	    assc = described_class.reflect_on_association(:user)
	    expect(assc.macro).to eq :belongs_to
  	end
 	

  end

  context "scope test" do
  	let(:user) {{:email => "jane@doe.com", :password => "pw123412345678",:username => "Janedoe"} }
  	let(:sort) {{sort:"The Wooden Hut"}}
  	let(:user1) { User.all.first}
  	let(:sort1) { Sort.all.first}

  	before(:each) do
		User.new(user).save
		Sort.new(sort).save
  	end
  	
  	it "can create a listing" do
  		listing = Listing.new(name:"The James Treehouse",user:user1,
  			sort:sort1,price_per_night:120).save
  		expect(listing).to eq(true)
  	end

  	it "cannot create a user with the same name" do
  		repeat = User.new(:email => "jane@gmail.com", :password => "pw123412345678",:username => "Janedoe").save
  		expect(repeat).to eq(true)
  	end

  	it "can return the listing in a price range" do
  		listing = Listing.new(name:"The James Treehouse",user:user1,
  			sort:sort1,price_per_night:120).save
  		listing_price = Listing.where("price_per_night > ?",100).first
  		expect(listing_price.name).to eq("The James Treehouse")
  	end

  	it "can upload up to five pics" do
  		listing = Listing.new(name:"The James Treehouse",user:user1,
  			sort:sort1,price_per_night:120).save
  		testing = Listing.all.first
  		expect(testing.image_uploaded_is_less_than_5).to eq(true)
  	end
  end
end
