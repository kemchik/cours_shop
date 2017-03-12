require 'test_helper'

class BasketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get basket_index_url
    assert_response :success
  end

end
