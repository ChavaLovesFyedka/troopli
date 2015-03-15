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
  end

  test "an admin approves member's request" do
    request = "requesting@example.com has requested troop leadership."

    sign_in(members(:valid_admin))
    visit admin_panel_path

    assert page.has_content?(request)

    click_link 'Send invitation to requesting@example.com'

    assert page.has_content?('requesting@example.com is now a leader.')
    assert current_path == admin_panel_path
    assert_not page.has_content?(request)

    click_link 'Logout'
  end

  test "post :send_leader_invitation sends email(s)" do 
    sign_in(members(:valid_admin))

    visit admin_panel_path
    
    fill_in 'emails', with: 'friend@example.com'
    
    assert_difference 'ActionMailer::Base.deliveries.count' do 
      click_button 'Send'
    end

    assert page.has_content?("Sent invitation to friend@example.com.")
    assert current_path == admin_panel_path
  end
end
