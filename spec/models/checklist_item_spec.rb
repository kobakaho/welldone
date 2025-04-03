require 'rails_helper'

RSpec.describe ChecklistItem, type: :model do
  context '全てのフィールドが有効な場合' do
    it '成功する' do
      checklist_item = build(:checklist_item)
      expect(checklist_item).to be_valid
    end
  end

  describe 'バリデーションチェック' do
    context 'name' do
      it '値がない場合失敗' do
        checklist_item = build(:checklist_item, name: nil)
        expect(checklist_item).to be_invalid
        expect(checklist_item.errors[:name]).not_to be_empty
      end
    end
  end
end
