class UserMailer < ApplicationMailer
  def comeback_email
    @user_name = "test"
    @url = "http://localhost:3000/users/sign_in"
    mail(to: "test@example.com", subject: "断捨離の時期が近づいてきました！！")
  end
end
