require "test_helper"

class Admin::BackersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_backers_index_url
    assert_response :success
  end
end
