require 'rails_helper'

RSpec.describe "AdminUsers", type: :system do
  describe '管理者ログイン画面' do
    let(:admin) { create :user, :admin }
    context 'adminユーザーでログインする場合' do
      it '管理者画面に遷移する' do
        visit login_path
        login(admin)
        expect(current_path).to eq rails_admin_path
      end
    end

    context 'adminユーザーでログアウトする場合' do
      it 'ログイン画面に遷移する' do
        visit login_path
        login(admin)
        expect(current_path).to eq rails_admin_path
        click_on 'ログアウト'
        expect(current_path).to eq login_path
      end
    end
  end
end
