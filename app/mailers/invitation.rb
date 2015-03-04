class Invitation < ActionMailer::Base
  default from: "from@example.com"

  def leader_invitation(email)
    mail(to: email, subject: 'Join us at Troopli!')
  end
end
