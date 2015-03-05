# Preview all emails at http://localhost:3000/rails/mailers/invitation
class InvitationPreview < ActionMailer::Preview
  def leader_invitation
    Invitation.leader_invitation("user@example.com")
  end
end
