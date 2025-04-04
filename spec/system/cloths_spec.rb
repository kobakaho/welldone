require 'rails_helper'

RSpec.describe "Cloths", type: :system do
  let(:user) { create(:user) }
  let(:cloth) { create(:cloth)}

  describe 'ログイン前' do
    describe 'clothCRUD' do
      context 'ログインページにリダイレクトされる' do
        it 'index画面へのアクセスに失敗する' do
          visit cloths_path
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end

        it 'create画面へのアクセスに失敗する' do
          visit new_cloth_path
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end

        it 'edit画面へのアクセスに失敗する' do
          visit edit_cloth_path(cloth)
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end

        it 'show画面へのアクセスに失敗する' do
          visit cloth_path(cloth)
          expect(current_path).to eq new_user_session_path
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end
      end
    

      describe 'ログイン後' do
        before { login_as(user) }

        context ''
      end
    end
  end
end



