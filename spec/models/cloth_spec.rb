require 'rails_helper'

RSpec.describe Cloth, type: :model do
  let(:cloth) { create(:cloth) }
  let(:season) { create(:season) }
  let(:category) { create(:category) }

  it '関連するテーブルが正しく設定された場合' do
    cloth = build(:cloth, seasons: [ season ], categories: [ category ])
    expect(cloth).to be_valid
  end

  describe 'バリデーションチェック' do
    it '設定したすべてのバリデーションが機能しているか' do
      cloth = build(:cloth)
      expect(cloth).to be_valid
      expect(cloth.errors).to be_empty
    end

    context 'ブランド' do
      it '50文字以内なら成功' do
        cloth = build(:cloth, brand: 'a' * 50)
        expect(cloth).to be_valid
        expect(cloth.errors).to be_empty
      end

      it '51文字以上なら失敗' do
        cloth = build(:cloth, brand: 'a' * 51)
        expect(cloth).to be_invalid
        expect(cloth.errors[:brand]).not_to be_empty
      end
    end

    context '購入理由' do
      it '65535文字以内なら成功' do
        cloth = build(:cloth, body: 'a' * 65_535)
        expect(cloth).to be_valid
        expect(cloth.errors).to be_empty
      end

      it '65536文字以上なら失敗' do
        cloth = build(:cloth, body: 'a' * 65_536)
        expect(cloth).to be_invalid
        expect(cloth.errors[:body]).not_to be_empty
      end
    end

    context '購入日' do
      it '今日以前なら成功' do
        cloth = build(:cloth, purchase_date: Date.today)
        expect(cloth).to be_valid
        expect(cloth.errors).to be_empty
      end

      it '今日以降なら失敗' do
        cloth = build(:cloth, purchase_date: Date.today + 1)
        expect(cloth).to be_invalid
        expect(cloth.errors[:purchase_date]).not_to be_empty
      end
    end

    context '購入金額' do
      it '0円以上9,999,999円以下なら成功' do
        cloth = build(:cloth, price: 3000)
        expect(cloth).to be_valid
        expect(cloth.errors).to be_empty
      end

      it '0円以下なら失敗' do
        cloth = build(:cloth, price: -1)
        expect(cloth).to be_invalid
        expect(cloth.errors[:price]).not_to be_empty
      end

      it '9,999,999円以上なら失敗' do
        cloth = build(:cloth, price: 10_000_000)
        expect(cloth).to be_invalid
        expect(cloth.errors[:price]).not_to be_empty
      end
    end

    context 'シーズン' do
      it '空の場合は失敗' do
        cloth = build(:cloth, seasons: [])
        cloth.seasons.clear
        expect(cloth).to be_invalid
        expect(cloth.errors[:season_ids]).not_to be_empty
      end
    end

    context 'カテゴリー' do
      it '空の場合は失敗' do
        cloth = build(:cloth, categories: [])
        cloth.categories.clear
        expect(cloth).to be_invalid
        expect(cloth.errors[:category_ids]).not_to be_empty
      end
    end
  end
end
