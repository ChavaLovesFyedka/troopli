require 'test_helper'

class TroopTest < ActiveSupport::TestCase
  def setup
    @troop = troops(:valid_troop)
  end

  test "can be created" do 
    troop = Troop.new(name: "A troop",
                      description: "A description",
                      age_level: 10)

    assert troop.save
  end

  test "responds to name" do 
    assert_respond_to @troop, :name
  end

  test "responds to description" do 
    assert_respond_to @troop, :description
  end

  test "responds to age_level" do 
    assert_respond_to @troop, :age_level
  end

  test "responds to leader" do 
    assert_respond_to @troop, :leader
  end
end
