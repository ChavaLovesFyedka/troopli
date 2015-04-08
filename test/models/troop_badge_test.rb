require 'test_helper'

class TroopBadgeTest < ActiveSupport::TestCase
  def setup
    @troop_badge = troop_badges(:valid_troop_badge)
  end

  test "responds to troop" do 
    assert_respond_to @troop_badge, :troop
  end

  test "responds to badge" do 
    assert_respond_to @troop_badge, :badge
  end
end
