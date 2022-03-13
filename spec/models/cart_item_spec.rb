# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CartItemモデルのテスト' do
  describe 'バリデーションのテスト' do
    subject { cart_item.valid? }

    let(:item) { create(:item) }
    let(:customer) { create(:customer) }
    let!(:cart_item) { build(:cart_item) }

    context 'amountカラム' do
      it '空欄でないこと' do
        cart_item.amount = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Itemモデルとの関係' do
      it 'N:1となっている' do
        expect(CartItem.reflect_on_association(:item).macro).to eq :belongs_to
      end
    end

    context 'Customerモデルとの関係' do
      it 'N:1となっている' do
        expect(CartItem.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end
  end
end