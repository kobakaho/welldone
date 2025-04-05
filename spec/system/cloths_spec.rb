require 'rails_helper'

RSpec.describe "Cloths", type: :system do
  let(:user) { create(:user) }
  let(:cloth) { create(:cloth, user: user) }
  let(:season) { create(:season) }
  let(:category) { create(:category) }

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
    end
  end

  describe 'ログイン後' do
    before { login_as(user, scope: :user) }

    describe 'index画面' do
      context 'clothがある場合' do
        it 'index画面が表示される' do
          cloth = create(:cloth, user: user, season_ids: [ season.id ], category_ids: [ category.id ])
          visit cloths_path
          expect(page).to have_selector('img')
        end
      end

      context 'clothが15件以下の場合' do
        let!(:cloths) { create_list(:cloth, 15, user: user) }
        it 'ページネーションが表示されないこと' do
          visit cloths_path
          expect(page).not_to have_selector(".pagination")
        end
      end

      context 'clothが16件以上の場合' do
        let!(:cloths) { create_list(:cloth, 16, user: user) }
        it 'ページネーションが表示されること' do
          visit cloths_path
          expect(page).to have_selector(".pagination")
        end
      end
    end

    describe 'create画面' do
      it '新規作成に成功する' do
        cloth = create(:cloth, user: user, season_ids: [ season.id ], category_ids: [ category.id ])
        visit new_cloth_path
        click_button "登録"
        check "cloth_season_ids_#{season.id}"
        expect(current_path).to eq('/cloths/new')
      end

      context '新規作成に失敗する' do
        it 'シーズンが未入力' do
          cloth = create(:cloth, user: user, season_ids: [ season.id ], category_ids: [ category.id ])
          visit new_cloth_path
          click_button "登録"
          expect(page).to have_content('シーズン必須項目です')
          expect(current_path).to eq(new_cloth_path)
        end

        it 'カテゴリーが未入力' do
          cloth = create(:cloth, user: user, season_ids: [ season.id ], category_ids: [ category.id ])
          visit new_cloth_path
          check "cloth_season_ids_#{season.id}"
          click_button "登録"
          expect(page).to have_content('カテゴリー必須項目です')
          expect(current_path).to eq(new_cloth_path)
        end
      end
    end

    describe 'show画面' do
      it 'show画面が表示されること' do
        cloth = create(:cloth, user: user, season_ids: [ season.id ], category_ids: [ category.id ])
        visit cloth_path(cloth)
        expect(page).to have_content(season.name)
        expect(page).to have_content(category.name)
      end

      it '編集できること' do
        cloth = create(:cloth, user: user, season_ids: [ season.id ], category_ids: [ category.id ])
        visit edit_cloth_path(cloth)
        check "cloth_season_ids_#{season.id}"
        click_button '登録'
      end

      it '削除できること' do
        cloth = create(:cloth, user: user, season_ids: [ season.id ], category_ids: [ category.id ])
        visit cloth_path(cloth)
        accept_confirm do
          click_link "delete"
        end
        expect(page).to have_content('アイテムを削除しました')
        expect(page).not_to have_content(cloth)
      end
    end
  end
end
