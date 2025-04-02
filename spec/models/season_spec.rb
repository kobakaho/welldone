require 'rails_helper'

RSpec.describe Season, type: :model do
  let(:season) { build(:season) }

  describe 'バリデーションチェック' do
    context 'name' do
      it '値がある場合成功' do
        expect(season).to be_valid
      end

      it '値がない場合失敗' do
        season.name = nil
        expect(season).to be_invalid
        expect(season.errors[:name]).not_to be_empty
      end
    end
  end
end
