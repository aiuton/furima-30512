require 'rails_helper'

describe Order, type: :model do
  describe '#create' do
    # nul:false, presence: true のテスト ▼


    it 'postcodeがないと保存できない' do
      order = FactoryBot.build(:order, postcode: '')
      order.valid?
      expect(order.errors[:postcode]).to include("can't be blank")
    end

    it 'prefecture_idが1だと保存できない' do
      order = FactoryBot.build(:order, prefecture_id: '1')
      order.valid?
      expect(order.errors[:prefecture_id]).to include("can't be blank")
    end

    it 'cityがないと保存できない' do
      order = FactoryBot.build(:order, city: '')
      order.valid?
      expect(order.errors[:city]).to include("can't be blank")
    end

    it 'street_addressがないと保存できない' do
      order = FactoryBot.build(:order, street_address: '')
      order.valid?
      expect(order.errors[:street_address]).to include("can't be blank")
    end

    it 'phone_numberがないと保存できない' do
      order = FactoryBot.build(:order, phone_number: '')
      order.valid?
      expect(order.errors[:phone_number]).to include("can't be blank")
    end

  end
end
