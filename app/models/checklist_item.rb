class ChecklistItem < ApplicationRecord
  validates :name, presence: true# , optional: true デフォルトのリストはuser_idがnull

  belongs_to :checklist
end
