require 'test_helper'

class CourseDeptControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get course_dept_index_url
    assert_response :success
  end

end
