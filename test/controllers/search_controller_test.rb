require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get airbnb" do
    get search_airbnb_url
    assert_response :success
  end

end
