require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test "admin can approve leader" do 
    sign_in members(:valid_admin)

    put :approve, id: members(:requesting_member)
    
    assert_redirected_to admin_panel_path
    assert_equal flash[:notice], "#{members(:requesting_member).email} is now a leader." 
  end

  test "admin can reject leader" do 
    sign_in members(:valid_admin)

    put :reject, id: members(:requesting_member)
    
    assert_redirected_to admin_panel_path
    assert_equal flash[:notice], "#{members(:requesting_member).email}'s request to be a leader has been rejected."  
  end
end
