require "test_helper"

class Public::BackersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_backers_new_url
    assert_response :success
  end

  test "should get log" do
    get public_backers_log_url
    assert_response :success
  end

  test "should get complete" do
    get public_backers_complete_url
    assert_response :success
  end

  test "should get index" do
    get public_backers_index_url
    assert_response :success
  end
end
