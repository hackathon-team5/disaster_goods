require 'rails_helper'

RSpec.describe "Goods", type: :system do
  describe '診断機能画面' do
    before do
      @first_type = Type.find(5)
      @first_goods = Good.where(type_id: @first_type.id) 
    end
    context '渋谷区本町５丁目を検索した場合' do
      it '診断結果画面が適切に表示される' do
        visit search_path
        select '渋谷区', from: 'district_id'
        select '本町５丁目', from: 'town_id'
        click_on '診断する'
        expect(page).to have_content('ランク4'), '総合危険度が正しく表示されていません'
        expect(page).to have_content(@first_type.name), 'タイプが正しく表示されていません'
        click_on 'おすすめグッズを見る'
        expect(page).to have_content(@first_type.description)
        @first_goods.each do |goods|
          expect(page).to have_content(goods.name), 'タイプに適したグッズが提案されていません'
        end
      end
    end
  end

  describe '診断機能画面' do
    before do
      @second_type = Type.find(3)
      @second_goods = Good.where(type_id: @second_type.id) 
    end
    context '杉並区阿佐谷南３丁目を検索した場合' do
      it '診断結果画面が適切に表示される' do
        visit search_path
        select '杉並区', from: 'district_id'
        select '阿佐谷南３丁目', from: 'town_id'
        click_on '診断する'
        expect(page).to have_content('ランク4'), '総合危険度が正しく表示されていません'
        expect(page).to have_content(@second_type.name), 'タイプが正しく表示されていません'
        click_on 'おすすめグッズを見る'
        expect(page).to have_content(@second_type.description)
        @second_goods.each do |goods|
          expect(page).to have_content(goods.name), 'タイプに適したグッズが提案されていません'
        end
      end
    end
  end

  describe '診断機能画面' do
    before do
      @third_type = Type.find(5)
      @third_goods = Good.where(type_id: @third_type.id) 
    end
    context '世田谷区池尻４丁目を検索した場合' do
      it '診断結果画面が適切に表示される' do
        visit search_path
        select '世田谷区', from: 'district_id'
        select '池尻４丁目', from: 'town_id'
        click_on '診断する'
        expect(page).to have_content('ランク2'), '総合危険度が正しく表示されていません'
        expect(page).to have_content(@third_type.name), 'タイプが正しく表示されていません'
        click_on 'おすすめグッズを見る'
        expect(page).to have_content(@third_type.description)
        @third_goods.each do |goods|
          expect(page).to have_content(goods.name), 'タイプに適したグッズが提案されていません'
        end
      end
    end
  end
end
