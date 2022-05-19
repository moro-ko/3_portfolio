require "test_helper"

class Public::ReturnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_returns_new_url
    assert_response :success
  end

  test "should get index" do
    get public_returns_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_returns_edit_url
    assert_response :success
  end
end
