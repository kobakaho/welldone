class Checklist < ApplicationRecord
  validates :title, presence: true
  validates :name, presence: true

  belongs_to :user
end
