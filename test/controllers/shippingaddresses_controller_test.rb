require 'test_helper'

class ShippingaddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shippingaddresses_create_url
    assert_response :success
  end

  test "should get update" do
    get shippingaddresses_update_url
    assert_response :success
  end

end
