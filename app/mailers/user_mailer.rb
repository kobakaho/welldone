class UserMailer < ApplicationMailer
  default from: "from@example"
  
  def comeback_email
    @user = user
    @url = "http://localhost:3000/users/sign_in"
    mail(to: @user.email, subject: "断捨離の時期が近づいてきました！！")
  end
end
