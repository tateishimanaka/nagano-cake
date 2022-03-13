# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Itemモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { item.valid? }

    let(:genre) { create(:genre) }
    let!(:item) { build(:item) }

    context 'nameカラム' do
      it '空欄でないこと' do
        item.name = ''
        is_expected.to eq false
      end
    end

    context 'imageカラム' do
      it '空欄でないこと' do
        item.image = ''
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '空欄でないこと' do
        item.introduction = ''
        is_expected.to eq false
      end
    end

    context 'priceカラム' do
      it '空欄でないこと' do
        item.price = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Genreモデルとの関係' do
      it 'N:1となっている' do
        expect(Item.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end

    context 'CartItemモデルとの関係' do
      it '1:Nとなっている' do
        expect(Item.reflect_on_association(:cart_items).macro).to eq :has_many
      end
    end

    context 'OrderItemモデルとの関係' do
      it '1:Nとなっている' do
        expect(Item.reflect_on_association(:order_items).macro).to eq :has_many
      end
    end
  end
end