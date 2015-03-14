require 'test_helper'

class CalendarsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, troop_id: troops(:valid_troop).id, date: Date.today
    assert_response :success
  end
end
