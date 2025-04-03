require 'rails_helper'

RSpec.describe Checklist, type: :model do
  context '全てのフィールドが有効な場合' do
    it '成功する' do
      checklist = build(:checklist)
      expect(checklist).to be_valid
    end
  end

  describe 'バリデーションチェック' do
    context 'title' do
      it '必須項目であること' do
        checklist = build(:checklist)
        checklist.title = nil
        checklist.valid?
        expect(checklist.errors[:title]).not_to be_empty
      end

      it 'ユニークであること' do
        checklist1 = create(:checklist, title: 'unique title')
        checklist2 = build(:checklist, title: 'unique title')
        checklist2.valid?
        expect(checklist2.errors[:title]).not_to be_empty
      end
    end
  end
end
