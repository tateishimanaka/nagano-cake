# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orderモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { order.valid? }

    let(:customer) { create(:customer) }
    let!(:order) { build(:order) }

    context 'postal_codeカラム' do
      it '空欄でないこと' do
        order.postal_code = ''
        is_expected.to eq false
      end
    end

    context 'addressカラム' do
      it '空欄でないこと' do
        order.address = ''
        is_expected.to eq false
      end
    end

    context 'nameカラム' do
      it '空欄でないこと' do
        order.name = ''
        is_expected.to eq false
      end
    end

    context 'payment_methodカラム' do
      it '空欄でないこと' do
        order.payment_method = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(Order.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'OrderItemモデルとの関係' do
      it '1:Nとなっている' do
        expect(Order.reflect_on_association(:order_items).macro).to eq :has_many
      end
    end
  end
end