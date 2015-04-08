require 'test_helper'

class TroopsControllerTest < ActionController::TestCase
  setup do
    @troop = troops(:valid_troop)

    @valid_params = { age_level: 1,
                      description: "A troop that exists.",
                      name: "A Name" }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:troops)
  end

  test "should get new" do
    sign_in members(:valid_leader)

    get :new
    assert_response :success
  end

  test "must be leader to get new" do 
    sign_in members(:valid_member)

    get :new
    assert_response :redirect
  end

  test "should create troop" do
    sign_in members(:valid_leader)
    
    assert_difference('Troop.count') do
      post :create, troop: @valid_params
    end

    assert_redirected_to troop_path(assigns(:troop))
  end

  test "invalid create renders new with alert" do 
    sign_in members(:valid_leader)

    assert_no_difference('Troop.count') do 
      post :create, troop: { name: '' }
    end

    assert_template :new
    assert flash[:alert] == "Could not save troop."
  end

  test "should show troop" do
    sign_in members(:valid_member)

    get :show, id: @troop
    assert_response :success
  end

  test "must be member to show troop" do 
    get :show, id: @troop
    assert_response :redirect
  end

  test "should get edit" do
    sign_in members(:valid_leader)

    get :edit, id: @troop
    assert_response :success
  end

  test "should update troop" do
    sign_in members(:valid_leader)

    patch :update, id: @troop, troop: { age_level: @troop.age_level,
                                        description: @troop.description,
                                        name: @troop.name }

    assert_redirected_to troop_path(assigns(:troop))
  end

  test "invalid update renders edit with alert" do 
    sign_in members(:valid_leader)

    patch :update, id: @troop, troop: { name: '' }

    assert_template 'edit'
    assert flash[:alert] == "Could not save troop."
  end

  test "should destroy troop" do
    sign_in members(:valid_leader)

    assert_difference('Troop.count', -1) do
      delete :destroy, id: @troop
    end

    assert_redirected_to troops_path
  end
end
