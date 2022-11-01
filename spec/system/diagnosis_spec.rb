require 'rails_helper'

RSpec.describe "Diagnosis", type: :system do
  describe '診断機能画面' do
    before do
      @first_type = Type.find(5)
    end
    context '渋谷区本町５丁目を検索した場合' do
      it '診断結果画面が適切に表示される' do
        visit search_path
        select '渋谷区', from: 'district_id'
        select '本町５丁目', from: 'town_id'
        click_on '診断する'
        expect(page).to have_content('ランク4'), '総合危険度が正しく表示されていません'
        expect(page).to have_content(@first_type.name), 'タイプが正しく表示されていません'
      end
    end
  end

  describe '診断機能画面' do
    before do
      @second_type = Type.find(3)
    end
    context '杉並区阿佐谷南３丁目を検索した場合' do
      it '診断結果画面が適切に表示される' do
        visit search_path
        select '杉並区', from: 'district_id'
        select '阿佐谷南３丁目', from: 'town_id'
        click_on '診断する'
        expect(page).to have_content('ランク4'), '総合危険度が正しく表示されていません'
        expect(page).to have_content(@second_type.name), 'タイプが正しく表示されていません'
      end
    end
  end

  describe '診断機能画面' do
    before do
      @third_type = Type.find(5)
    end
    context '世田谷区池尻４丁目を検索した場合' do
      it '診断結果画面が適切に表示される' do
        visit search_path
        select '世田谷区', from: 'district_id'
        select '池尻４丁目', from: 'town_id'
        click_on '診断する'
        expect(page).to have_content('ランク2'), '総合危険度が正しく表示されていません'
        expect(page).to have_content(@third_type.name), 'タイプが正しく表示されていません'
      end
    end
  end
end
