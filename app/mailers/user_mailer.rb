class UserMailer < ActionMailer::Base
  default from: "toby.sims@gmail.com"


  def registration_email(user)
      @user = user
      @url  = "http://localhost:3000/register/#{user.code}"
      mail(:to => user.email, :subject => "Beer is brilliant.")
    end

end
