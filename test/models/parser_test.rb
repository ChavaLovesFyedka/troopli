require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  def setup
    @file_path = "Patches1.csv"
  end

  test "parser.badge_list creates badges" do 
    parser = Parser.new(@file_path)
    badge_count = Badge.count
    
    parser.badge_list

    assert Badge.count > badge_count  
  end
end
