require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: events(:valid_event)
    assert_response :success
  end
end
