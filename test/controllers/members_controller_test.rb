require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  test "admin can approve leader" do 
    sign_in members(:valid_admin)
    member = members(:requesting_member)
    put :approve, id: member
    
    assert_redirected_to admin_panel_path
    assert_equal flash[:notice], "#{member.email} is now a leader." 
  end

  test "admin can reject leader" do 
    sign_in members(:valid_admin)
    member = members(:requesting_member)

    put :reject, id: member 
    
    assert_redirected_to admin_panel_path
    assert_equal flash[:notice],
                  "#{member.email}'s request to be a leader has been rejected."  
  end

  test "admin can destroy a member" do 
    sign_in members(:valid_admin)
    member = members(:valid_member)

    delete :destroy, id: member 

    assert_redirected_to admin_panel_path
    assert_equal flash[:notice],
                            "#{member.email} has been removed from the system."
  end
end
