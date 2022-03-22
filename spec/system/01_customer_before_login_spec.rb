# frozen_string_literal: true

require 'rails_helper'

describe '[STEP1]customerログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end

      it '店名が表示される' do
        expect(page).to have_content 'NAGANO-CAKE'
      end

      it 'Aboutのリンクが表示される: 左上1番目のリンクが「About」である' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match "About"
      end

      it 'Aboutリンクの内容が正しい' do
        about_link = find_all('a')[1].native.inner_text
        expect(page).to have_link about_link, href: about_path_path
      end

      it '商品一覧のリンクが表示される: 左上2番目のリンクが「商品一覧」である' do
        items_link = find_all('a')[2].native.inner_text
        expect(items_link).to match "商品一覧"
      end

      it '商品一覧のリンクの内容が正しい' do
        items_link = find_all('a')[2].native.inner_text
        expect(page).to have_link items_link, href: items_path
      end

      it '新規登録のリンクが表示される: 左上3番目のリンクが「新規登録」である' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match "新規登録"
      end

      it '新規登録の内容が正しい' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(page).to have_link sign_up_link, href: new_customer_registration_path
      end

      it 'ログインのリンクが表示される: 左上4番目のリンクが「ログイン」である' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(log_in_link).to match "ログイン"
      end

      it 'ログインリンクの内容が正しい' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(page).to have_link log_in_link, href: new_customer_session_path
      end
    end
  end
end