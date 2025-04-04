require 'rails_helper'

RSpec.describe "Commons", type: :system do

  context 'ログイン前' do
    before do
      visit root_path
    end

    describe 'ヘッダー' do
      it 'ヘッダーが正しく表示されていること' do
        expect(page).to have_content('ログイン')
        expect(page).to have_content('アカウント登録')
      end
    end

    describe 'フッター' do
      it 'フッターが正しく表示されていること' do
        expect(page).to have_content("GitHub")
        expect(page).to have_content("お問い合わせフォーム")
        expect(page).to have_content("利用規約")
        expect(page).to have_content("プライバシーポリシー")
      end
    end

    describe 'タイトル' do
      it 'タイトルが正しく表示されていること' do
        expect(page).to have_title("well断")
      end
    end
  end
end
