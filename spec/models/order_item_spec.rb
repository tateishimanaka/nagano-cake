# frozen_string_literal: true

require 'rails_helper'

Rspec.describe OrderItem, "OrderItemモデルのテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な内容の場合保存されるのか" do
      expect(FactoryBot.build(:order_item)).to be_valid
    end
  end
end