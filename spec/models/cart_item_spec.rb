# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CartItemモデルのテスト', type: :model do
  describe '実際に保存してみる' do
    it '有効な投稿の場合は保存されるのか' do
      expect(FactoryBot.build(:cart_item)).to be_valid
    end
  end
  # describe 'バリデーションのテスト' do
  #   subject { cart_item.valid? }

  #   let(:customer) { create(:customer) }
  #   let(:item) { create(:item) }
  #   let!(:cart_item) { build(:cart_item, customer_id: customer.id, item_id: item.id ) }

  #   context 'amountカラム' do
  #     it '空欄でないこと' do
  #       cart_item.amount = ''
  #       is_expected.to eq false
  #     end
  #   end
  # end

  describe 'アソシエーションのテスト' do
    context 'Customerモデルとの関係性' do
      it 'N:1の関係性になっているか' do
        expect(CartItem.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'Itemモデルとの関係性' do
      it 'N:1の関係性になっているか' do
        expect(CartItem.reflect_on_association(:item).macro).to eq :belongs_to
      end
    end
  end
end