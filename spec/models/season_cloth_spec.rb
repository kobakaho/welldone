require 'rails_helper'

RSpec.describe SeasonCloth, type: :model do
  let(:cloth) { create(:cloth) }
  let(:season) { create(:season) }

  context '全てのフィールドが有効な場合' do
    it '有効であること' do
      season_cloth = build(:season_cloth)
      expect(season_cloth).to be_valid
    end
  end

  context 'clothとseasonの組み合わせがユニークでない場合' do
    it '失敗する' do
      season_cloth = create(:season_cloth, cloth: cloth, season: season)
      new_season_cloth = build(:season_cloth, cloth: season_cloth.cloth, season: season_cloth.season)
      new_season_cloth.valid?
      expect(new_season_cloth.errors[:season_id]).not_to be_empty
    end
  end
end  
