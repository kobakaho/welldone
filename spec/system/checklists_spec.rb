require 'rails_helper'

RSpec.describe "Checklists", type: :system do
  let(:user) { create(:user) }
  let(:checklist) { create(:checklist, user: user) }

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

  describe 'ログイン後' do
    before { login_as(user, scope: :user) }

    describe 'checklistCRUD' do
      context 'checklistがある場合' do
        it 'index画面が表示される' do
          checklist_list = create_list(:checklist, 3, user: user)
          visit checklists_path
          expect(page).to have_content checklist_list[0].title
          expect(page).to have_content checklist_list[1].title
          expect(page).to have_content checklist_list[2].title
          expect(current_path).to eq checklists_path
        end
      end

      describe 'create画面' do
        context '成功する' do
          it '入力が正常' do
            visit new_checklist_path
            fill_in "checklist[title]", with: "sample"
            click_button "登録"
            expect(page).to have_content "sample"
            expect(current_path).to start_with("/checklists")
          end
        end

        context '失敗する' do
          it 'titleが未入力' do
            visit new_checklist_path
            fill_in "checklist[title]", with: ""
            click_button "登録"
            expect(page).to have_content "タイトルを入力してください"
            expect(current_path).to start_with("/checklists")
          end
        end
      end

      describe 'show画面' do
        it 'show画面が表示される' do
          checklist = create(:checklist, user: user)
          visit checklist_path(checklist)
          expect(page).to have_content(checklist.title)
        end

        describe 'edit画面' do
          context '成功する' do
            it '入力が正常' do
              visit edit_checklist_path(checklist)
              fill_in "checklist[title]", with: "sample_1"
              click_button "登録"
              expect(page).to have_content "sample_1"
              expect(current_path).to start_with("/checklists")
            end
          end

          context '失敗する' do
            it 'titleが未入力' do
              visit edit_checklist_path(checklist)
              fill_in "checklist[title]", with: ""
              click_button "登録"
              expect(page).to have_content "タイトルを入力してください"
              expect(current_path).to start_with("/checklists")
            end
          end
        end

        it 'deleteできる' do
          visit checklist_path(checklist)
          accept_confirm do
            click_link "delete"
          end
          expect(page).to have_content('チェックリストを削除しました')
          expect(page).not_to have_content(checklist)
        end
      end
    end
  end
end
