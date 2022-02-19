# frozen_string_literal: true

require 'rails_helper'

Rspec.describe Order, "Orderモデルのテスト", type: :model do
  describe '実査に保存する' do
    it "有効な内容の場合保存されるか" do
      expect(FactoryBot.build(:order)).to be_valid
    end
  end
end