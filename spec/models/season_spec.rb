require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'バリデーションチェック' do
    context 'name' do
      it '値がある場合成功' do
        season = build(:season, name: 'Spring')
        expect(season).to be_valid
      end

      it '値がない場合失敗' do
        season = build(:season, name: '')
        expect(season).to be_invalid
        expect(season.errors[:name]).not_to be_empty
      end
    end
  end
end
