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
      it 'ログインのリンクが表示される' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(log_in_link).to match "ログイン"
      end

      it 'ログインリンクの内容が正しい' do
        log_in_link = find_all('a')[4].native.inner_text
        expect(page).to have_link log_in_link, href: new_customer_session_path
      end

      it '新規登録のリンクが表示される' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match "新規登録"
      end

      it '新規登録の内容が正しい' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(page).to have_link sign_up_link, href: new_customer_registration_path
      end
    end
  end
end