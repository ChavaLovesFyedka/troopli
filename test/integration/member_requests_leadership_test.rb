require 'test_helper'

class MemberRequestsLeadershipTest < ActionDispatch::IntegrationTest
  test "a member requests leadership" do 
    visit new_member_registration_path
    
    fill_in 'Email', with: 'test@email.com' 
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'
    check 'member_leadership_request'
    
    click_button 'Sign up'

    assert current_path == root_path
    assert page.has_content?('Welcome! You have signed up successfully.')

    click_link 'Logout'

    sign_in(members(:valid_admin))
    visit admin_panel_path

    assert page.has_content?('test@email.com has requested troop leadership.')
  end
end
