require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーションチェック' do
    context 'name' do
      it '値がある場合成功' do
        category = build(:category, name: 'トップス')
        expect(category).to be_valid
      end

      it '値がない場合失敗' do
        category = build(:category, name: " ")
        expect(category).to be_invalid
        expect(category.errors[:name]).not_to be_empty
      end
    end
  end
end
