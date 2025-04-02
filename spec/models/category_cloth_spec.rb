require 'rails_helper'

RSpec.describe CategoryCloth, type: :model do
  let(:cloth) { create(:cloth) }
  let(:category) { create(:category) }

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      category_cloth = build(:category_cloth)
      expect(category_cloth).to be_valid
    end
  end

  context 'clothとcategoryの組み合わせがユニークでない場合' do
    it '失敗する' do
      category_cloth = create(:category_cloth, cloth: cloth, category: category)
      new_category_cloth = build(:category_cloth, cloth: category_cloth.cloth, category: category_cloth.category)
      new_category_cloth.valid?
      expect(new_category_cloth.errors[:category_id]).not_to be_empty
    end
  end
end
