# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OrderItemモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Itemモデルとの関係性' do
      it 'N:1の関係性になっているか' do
        expect(OrderItem.reflect_on_association(:item).macro).to eq :belongs_to
      end
    end

    context 'Orderモデルとの関係性' do
      it 'N:1の関係性になっているか' do
        expect(OrderItem.reflect_on_association(:order).macro).to eq :belongs_to
      end
    end
  end
end