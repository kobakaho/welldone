require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  describe 'バリデーションチェック' do
    context 'name' do
      it '値がある場合成功' do
        expect(category).to be_valid
      end

      it '値がない場合失敗' do
        category.name = nil
        expect(category).to be_invalid
        expect(category.errors[:name]).not_to be_empty
      end
    end
  end
end
