require "test_helper"

class Admin::ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_participants_index_url
    assert_response :success
  end
end
