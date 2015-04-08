require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  def setup
    @badge = badges(:valid_badge)
  end

  test "responds to troop_badges" do 
    assert_respond_to @badge, :troop_badges
  end

  test "responds to troops" do 
    assert_respond_to @badge, :troops
  end
end
