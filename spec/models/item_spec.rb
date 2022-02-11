# frozen_string_literal: true

require 'rails_helper'

Rspec.describe Item, "Itemモデルのテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるのか" do
      expect(FactoryBot.build(:item)).to be_valid
    end
  end
end