class SearchController < ApplicationController
  def airbnb
  	@searches = Listing.search(params[:airbnb]).limit(10)
  	render json:@searches
  end
  def show
  	if params[:place].present?
      @listings = Listing.order("RANDOM()").limit(8)
  		@searches = Listing.search(params[:place]).paginate(page:params[:page],per_page:10)
  	else
  		flash[:danger] = "Please enter something to search for!"
  		redirect_to root_path
  	end
  end
end
