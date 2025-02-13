class CategoryCloth < ApplicationRecord
  validates :category_id, uniqueness: { scope: :cloth_id }

  belongs_to :cloth
  belongs_to :category

  def self.maltievel_category_create(cloth, parent_id, children_id, grandchildren_id)
    if parent_id.present? && parent_id != '---'
      category = Category.find(parent_id)
      CategoryCloth.create(cloth_id: cloth.id, category_id: category.id)
    end

    if children_id.present? && children_id != '---'
      category = Category.find(children_id)
      CategoryCloth.create(cloth_id: cloth.id, category_id: category.id)
    end

    if grandchildren_id.present? && grandchildren_id != '---'
      category = Category.find(grandchildren_id)
      CategoryCloth.create(cloth_id: cloth.id, category_id: category.id)
    end
  end
end
