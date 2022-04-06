require "test_helper"

class Public::ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_participants_new_url
    assert_response :success
  end

  test "should get log" do
    get public_participants_log_url
    assert_response :success
  end

  test "should get complete" do
    get public_participants_complete_url
    assert_response :success
  end

  test "should get index" do
    get public_participants_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_participants_edit_url
    assert_response :success
  end
end
