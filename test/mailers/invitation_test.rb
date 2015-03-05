require 'test_helper'

class InvitationTest < ActionMailer::TestCase
  test "leader_invitation" do 
    email = Invitation.leader_invitation('me@example.com').deliver

    assert_not ActionMailer::Base.deliveries.empty?
    
    assert_equal ['me@example.com'], email.to
  end
end
