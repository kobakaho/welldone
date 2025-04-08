class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :confirmable　は追加する
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]
  has_many :cloths, dependent: :destroy
  has_many :checklists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_cloths, through: :favorites, source: :cloth

  validates :username, allow_blank: true, length: { maximum: 50 }
  validates :uid, presence: true, uniqueness: { scope: :provider }, if: -> { uid.present? }

  mount_uploader :profile_image, ProfileImageUploader
  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # user.name = auth.info.name
      # user.profile = auth.info.profile
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def favorite?(cloth)
    favorite_cloths.include?(cloth)
  end

  def favorite(cloth)
    favorite_cloths << cloth
  end

  def unfavorite(cloth)
    favorite_cloths.destroy(cloth)
  end
end
