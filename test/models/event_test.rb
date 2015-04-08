require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @event = events(:valid_event)
  end

  test "can be created" do 
    event = Event.new(name: "Hi",
                      description: "There",
                      start_at: Time.now,
                      end_at: Time.now)
    assert event.save
  end

  test "responds to name" do 
    assert_respond_to @event, :name
  end

  test "responds to description" do 
    assert_respond_to @event, :description
  end

  test "responds to start_at" do 
    assert_respond_to @event, :start_at
  end

  test "responds to end_at" do 
    assert_respond_to @event, :end_at
  end
  
  test "responds to troop" do 
    assert_respond_to @event, :troop
  end
end
