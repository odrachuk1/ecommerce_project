require 'test_helper'

class OrderDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get order_detail_new_url
    assert_response :success
  end

  test "should get create" do
    get order_detail_create_url
    assert_response :success
  end

end
