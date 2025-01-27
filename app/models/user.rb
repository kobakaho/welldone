class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :omniauthable,:confirmable　は追加する
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
