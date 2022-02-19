# frozen_string_literal: true

require 'rails_helper'

Rspec.describe Customer, "Customerモデルのテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な会員の場合は保存されるのか" do
      expect(FactoryBot.build(:customer)).to be_valid
    end
  end
end