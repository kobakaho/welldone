namespace :user do
  desc "ユーザーに3か月に1回メルマガを送る"
  task send: :environment do
    User.find_each do |user|
      UserMailer.comeback_email(user).deliver_now
    end
  end
end
