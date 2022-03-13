# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OrderItemモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Orderモデルとの関係' do
      it 'N:1となっている' do
        expect(OrderItem.reflect_on_association(:order).macro).to eq :belongs_to
      end
    end

    context 'Itemモデルとの関係' do
      it 'N:1となっている' do
        expect(OrderItem.reflect_on_association(:item).macro).to eq :belongs_to
      end
    end
  end
end