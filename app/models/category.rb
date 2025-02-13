class Category < ApplicationRecord
  validates :name, presence: true

  has_many :category_cloths, dependent: :destroy
  has_many :cloths, through: :category_cloths
  has_ancestry

  def self.category_parent_array_create
    category_parent_array = ['---']
    Category.where(ancestry: nil).each do |parent|
      category_parent_array << [parent.name, parent.id]
    end
    return category_parent_array
  end
end
