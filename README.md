# troopli

### Invitation

**app/mailers/invitation.rb**  
change `default from: "example@email.com"` to the email address you want
invitations to be sent from.

**app/views/invitation/leader_invitation.[html/text].erb**  
modify with invitation content.

**sample.env**  
create .env file and copy the contents of sample.env, then supply the variables
with your information.

If you are not using gmail.com as a domain, add DOMAIN to .env and write the
appropirate domain. Go into **config/environments/development.rb** and change
line 22 to `domain: ENV["DOMAIN"]`. Do the same thing for
**config/environments/production.rb** (the line number may not be the same - you
are changing the `domain` key in `config.action_mailer.smtp_settings`. Restart
your server after modifying these files.

In order to make sure that your variables are working, open up `bundle exec
rails console` and type:

    $ Invitation.leader_invitation("youremailaddress").deliver

Check your email. The invitation should have been sent to your email address.
