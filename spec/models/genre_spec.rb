# frozen_string_literal: true

require 'rails_helper'

Rspec.describe 'Genreモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { genre.valid? }

    let(:genre) { build(:genre) }

    context 'nameカラム' do
      it '空欄でないこと' do
        genre.name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Itemモデルとの関係性' do
      it '1:Nの関係性になっているか' do
        expect(Genre.reflect_on_association(:items).macro).to eq :has_many
      end
    end
  end
end