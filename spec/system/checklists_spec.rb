require 'rails_helper'

RSpec.describe "Checklists", type: :system do
  let(:user) { create(:user) }
  let(:checklist) { create(:checklist)}

  describe 'ログイン前' do
    describe 'checklisthCRUD' do
      context 'ログインページにリダイレクトされる' do
        it 'index画面へのアクセスに失敗する' do
          visit checklists_path
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end

        it 'create画面へのアクセスに失敗する' do
          visit new_checklist_path
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end

        it 'edit画面へのアクセスに失敗する' do
          visit edit_checklist_path(checklist)
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end

        it 'show画面へのアクセスに失敗する' do
          visit checklist_path(checklist)
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end
      end
    end
  end
end