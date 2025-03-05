class Checklist < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :checklist_items, dependent: :destroy
  belongs_to :user
end
