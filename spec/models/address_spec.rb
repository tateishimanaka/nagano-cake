# frozen_string_literal: true

require 'rails_helper'

Rspec.describe 'addressモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { address.valid? }

    let(:customer) { create(:customer) }
    let!(:address) { build(:address, customer_id: customer.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        address.name = ''
        is_expected.to eq false
      end
    end

    context 'postal_codeカラム' do
      it '空欄でないこと' do
        address.postal_code = ''
        is_expected.to eq false
      end
    end

    context 'addressカラム' do
      it '空欄でないこと' do
        address.address = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'customerモデルとの関係性' do
      it 'N:1の関係性になっている' do
        expect(Address.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end