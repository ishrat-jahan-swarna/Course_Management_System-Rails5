require 'test_helper'

class RejectProfileMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reject_profile_messages_create_url
    assert_response :success
  end

end
