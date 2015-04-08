class Invitation < ActionMailer::Base
  default from: "example@email.com"
 # Change this to the email you want people
  # to receive the invite from 

  def leader_invitation(email)
    mail(to: email, subject: 'Join us at Troopli!')
  end
end
