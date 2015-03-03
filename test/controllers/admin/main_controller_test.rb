require 'test_helper'

class Admin::MainControllerTest < ActionController::TestCase
  test "get panel" do 
    sign_in members(:valid_admin)
    get :panel
    assert_response :success
    assert_not_nil assigns(:requests)
  end
end
