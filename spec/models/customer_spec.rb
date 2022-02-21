# frozen_string_literal: true

require 'rails_helper'

Rspec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

    context 'last_nameカラム' do
      it '空欄でないこと' do
        customer.last_name = ''
        is_expected.to eq false
      end
    end

    context 'first_nameカラム' do
      it '空欄でないこと' do
        customer.first_name = ''
        is_expected.to eq false
      end
    end

    context 'last_name_kanaカラム' do
      it '空欄でないこと' do
        customer.last_name_kana = ''
        is_expected.to eq false
      end
    end

    context 'first_name_kanaカラム' do
      it '空欄でないこと' do
        customer.first_name_kana = ''
        is_expected.to eq false
      end
    end

    context 'postal_codeカラム' do
      it '空欄でないこと' do
        customer.postal_code = ''
        is_expected.to eq false
      end
    end

    context 'addressカラム' do
      it '空欄でないこと' do
        customer.address = ''
        is_expected.to eq false
      end
    end

    context 'telephone_numberカラム' do
      it '空欄でないこと' do
        customer.telephone_number = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'CartItemモデルとの関係性' do
      it '1:Nの関係性になっているか' do
        expect(Customer.reflect_on_association(:cart_items).macro).to eq :has_many
      end
    end

    context 'Orderモデルとの関係性' do
      it '1:Nの関係性になっている' do
        expect(Customer.reflect_on_association(:orders).macro).to eq :has_many
      end
    end

    context 'Addressモデルとの関係性' do
      it '1:Nの関係性になっている' do
        expect(Customer.reflect_on_association(:addresses).macro).to eq :has_many
      end
    end
  end
end