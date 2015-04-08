require 'test_helper'

class Admin::MainControllerTest < ActionController::TestCase
  test "get panel" do 
    sign_in members(:valid_admin)
    get :panel
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "member cannot get panel" do 
    sign_in members(:valid_member)
    get :panel
    assert_response :redirect
  end

  test "leader cannot get panel" do 
    sign_in members(:valid_leader)
    get :panel
    assert_response :redirect
  end

  test "guest cannot get panel" do 
    get :panel
    assert_response :redirect
  end
end
