require 'test_helper'

class WelcomeStudentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_student_index_url
    assert_response :success
  end

end
