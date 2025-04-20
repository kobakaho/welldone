class UserMailer < ApplicationMailer
  def comeback_email(user)
    @user = user
    @user_name = @user.username
    @url = "http://localhost:3000/users/sign_in"
    mail(
      to: @user.email,
      subject: "断捨離の時期が近づいてきました！！"
    )
  end
end
