# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Itemモデルのテスト', type: :model do
  describe '実際に保存してみる' do
    it '有効な投稿の場合は保存されるのか' do
      expect(FactoryBot.build(:item)).to be_valid
    end
  end
  # describe  'バリデーションのテスト' do
  #   subject { item.valid? }

  #   let(:genre) { create(:genre) }
  #   let!(:item) { build(:item, genre_id: genre.id) }

  #   context 'nameカラム' do
  #     it '空欄でないこと' do
  #       item.name = ''
  #       is_expexted.to eq false
  #     end
  #   end

  #   context 'imageカラム' do
  #     it '空欄でないこと' do
  #       item.image = ''
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'introductionカラム' do
  #     it '空欄でないこと' do
  #       item.introduction = ''
  #       is_expected.to eq false
  #     end
  #   end

  #   context 'priceカラム' do
  #     it '空欄でないこと' do
  #       item.price = ''
  #       is_expected.to eq false
  #     end
  #   end
  # end

  describe 'アソシエーションのテスト' do
    context 'genreモデルとの関係性' do
      it 'N:1の関係性になっている' do
        expect(Item.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end

    context 'cart_itemモデルとの関係性' do
      it '1:Nの関係性になっている' do
        expect(Item.reflect_on_association(:cart_items).macro).to eq :has_many
      end
    end

    context 'order_itemモデルとの関係性' do
      it '1:Nの関係性になっているか' do
        expect(Item.reflect_on_association(:order_items).macro).to eq :has_many
      end
    end
  end
end