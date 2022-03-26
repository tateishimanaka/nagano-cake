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

    context 'リンクの遷移先の確認' do
      it 'Aboutを押すと,アバウト画面に遷移する' do
        about_link = find_all('a')[1]
        about_link.click
        expect(page).to have_current_path about_path_path
      end

      it '商品一覧画を押すと、商品一覧画面に遷移する' do
        items_link = find_all('a')[2]
        items_link.click
        expect(page).to have_current_path items_path
      end

      it '新規登録を押すと、新規登録画面に遷移する' do
        sign_up_link = find_all('a')[3]
        sign_up_link.click
        expect(page).to have_current_path new_customer_registration_path
      end

      it 'ログインを押すと、ログイン画面に遷移する' do
        log_in_link = find_all('a')[4]
        log_in_link.click
        expect(page).to have_current_path new_customer_session_path
      end
    end
  end

  describe 'About画面のテスト' do
    before do
      visit '/about'
    end
    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end

  describe '商品一覧画面のテスト' do

  end

  describe '新規登録のテスト' do
    before do
      visit new_customer_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customer/sign_up'
      end

      it '「新規会員登録」と表示される' do
        expect(page).to have_content '新規会員登録'
      end

      it 'last_nameフォームが表示される' do
        expect(page).to have_field 'customer[last_name]'
      end

      it 'first_nameフォームが表示される' do
        expect(page).to have_field 'customer[first_name]'
      end

      it 'last_name_kanaフォームが表示される' do
        expect(page).to have_field 'customer[last_name_kana]'
      end

      it 'first_name_kanaフォームが表示される' do
        expect(page).to have_field 'customer[first_name_kana]'
      end

      it 'emailフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end

      it 'postal_codeフォームが表示される' do
        expect(page).to have_field 'customer[postal_code]'
      end

      it 'addressフォームが表示される' do
        expect(page).to have_field 'customer[address]'
      end

      it 'telephone_numberフォームが表示される' do
        expect(page).to have_field 'customer[telephone_number]'
      end

      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end

      it 'password確認用フォームが表示される' do
        expect(page).to have_field 'customer[password_confirmation]'
      end

      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'customer[email]', with: Faker::Internet.email
        fill_in 'customer[last_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[first_name]', with: Faker::Lorem.characters(number: 2)
        fill_in 'customer[last_name_kana]', with: Faker::Lorem.characters(number: 4)
        fill_in 'customer[first_name_kana]', with: Faker::Lorem.characters(number: 4)
        fill_in 'customer[postal_code]', with: Faker::Lorem.characters(number: 7)
        fill_in 'customer[address]', with: Faker::Lorem.characters(number: 5)
        fill_in 'customer[telephone_number]', with: Faker::Lorem.characters(number: 10)
        fill_in 'customer[password]', with: 'password'
        fill_in 'customer[password_confirmation]', with: 'password'
      end

      it '正しく登録される' do
        expect { click_button '新規登録' }.to change(customer, :count).by(1)
      end

      it '新規登録後のリダイレクト先が、トップ画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'ログイン' do
    let(:customer) { create(:customer) }

    before do
      visit new_customer_session_path
    end

    context '表示が正しい' do
      it 'URLが正しい' do
        expect(current_path).to eq '/customer/sign_in'
      end

      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end

      it 'emailフォームが表示される' do
        expect(page).to have_field 'customer[email]'
      end

      it 'passwordフォームが表示される' do
        expect(page).to have_field 'customer[password]'
      end

      it 'last_nameフォームが表示されない' do
        expect(page).not_to have_field 'customer[last_name]'
      end

      it 'first_nameフォームが表示されない' do
        expect(page).not_to have_field 'customer[first_name]'
      end

      it '「ログイン」ボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'customer[email]', with: customer.email
        fill_in 'customer[password]', with: customer.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先がトップ画面になっている' do
        expect(current_path).to eq '/'
      end
    end
    
    
  end
end