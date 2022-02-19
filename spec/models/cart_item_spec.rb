# frozen_string_literal: true

require 'rails_helper'

Rspec.describe CartItem, "CartItemモデルのテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な内容の場合保存されるのか" do
      expext(FactoryBot.build(:cart_item)).to be_valid
    end
  end
end