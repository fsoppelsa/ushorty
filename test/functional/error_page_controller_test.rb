require 'test_helper'

class ErrorPageControllerTest < ActionController::TestCase
  test "should get error_page" do
    get :error_page
    assert_response :success
  end

end
