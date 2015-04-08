require 'test_helper'

class InvitationTest < ActionMailer::TestCase
  test "leader_invitation" do
    # this test needs more information
    # specifically: email.from, email.subject
    # and content placed in fixture leader_invitation
    # for email.body

    email = Invitation.leader_invitation('me@example.com').deliver

    assert_not ActionMailer::Base.deliveries.empty?
    
    assert_equal ['me@example.com'], email.to
  end
end
