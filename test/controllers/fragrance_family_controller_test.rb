require 'test_helper'

class FragranceFamilyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fragrance_family_index_url
    assert_response :success
  end

  test "should get show" do
    get fragrance_family_show_url
    assert_response :success
  end

end
