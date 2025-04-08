class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cloth

  validates :user_id, uniqueness: { scope: :cloth_id } 
#あるユーザーが特定のボードに対してお気に入りを登録する場合、そのユーザーはそのボードに対して一つのレコードしか持てない
end
