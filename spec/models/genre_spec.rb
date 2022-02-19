# frozen_string_literal: true

require 'rails_helper'

Rspec.describe Genre, "Genreモデルのテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるのか" do
      expect(FactryBot.build(:genre)).to be_valid
    end
  end
end