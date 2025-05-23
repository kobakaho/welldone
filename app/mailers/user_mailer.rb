class UserMailer < ApplicationMailer
  def comeback_email(user)
    @user = user
    @user_name = @user.username

    if Rails.env.development?
      @url = "http://localhost:3000/users/sign_in"
    elsif Rails.env.production?
      @url = "http://welldoneshari.com/users/sign_in"
    end

    mail(
      to: @user.email,
      subject: "断捨離の時期が近づいてきました！！"
    )
  end
end
