require 'test_helper'

class FireworksControllerTest < ActionController::TestCase
  test "should get back_up" do
    get :back_up
    assert_response :success
  end

end
