# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe '実際に保存してみる' do
    it '有効な場合、保存されるか' do
      expect(FactoryBot.build(:customer)).to be_valid
    end
  end
  
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:customer) { build(:customer) }

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
    context 'CartItemモデルとの関係' do
      it '空欄でないこと' do
        expect(Customer.reflect_on_association(:cart_items).macro).to eq :has_many
      end
    end

    context 'Orderモデルとの関係' do
      it '空欄でないこと' do
        expect(Customer.reflect_on_association(:orders).macro).to eq :has_many
      end
    end

    context 'Addressモデルとの関係' do
      it '空欄でないこと' do
        expect(Customer.reflect_on_association(:addresses).macro).to eq :has_many
      end
    end
  end
end