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
      it 'ログインリンクが表示される' do
        log_in_link = find_all('a')[5].native.inner_text
        expect(log_in_link).to match(/log in/i)
      end
    end
  end
end