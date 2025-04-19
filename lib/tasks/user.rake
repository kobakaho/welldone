namespace :user do
  desc "ユーザーに3か月に1回メルマガを送る"
  task send: :environment do
    UserMailer.comeback_email.deliver_now
  end
end
