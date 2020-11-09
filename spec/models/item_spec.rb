require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    
    # nul:false, presence: true のテスト ▼

    it 'imageがないと保存できない' do
      item = FactoryBot.build(:item, image: nil)
      item.valid?
      expect(item.errors[:image]).to include("can't be blank")
    end

    it 'titleがないと保存できない' do
      item = FactoryBot.build(:item, title: '')
      item.valid?
      expect(item.errors[:title]).to include("can't be blank")
    end

    it 'descriptionがないと保存できない' do
      item = FactoryBot.build(:item, description: '')
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it 'category_idが1だと保存できない' do
      item = FactoryBot.build(:item, category_id: '1')
      item.valid?
      expect(item.errors[:category_id]).to include('must be other than 1')
    end

    it 'shipping_cost_idが1だと保存できない' do
      item = FactoryBot.build(:item, shipping_cost_id: '1')
      item.valid?
      expect(item.errors[:shipping_cost_id]).to include('must be other than 1')
    end

    it 'shipping_days_idが1だと保存できない' do
      item = FactoryBot.build(:item, shipping_days_id: '1')
      item.valid?
      expect(item.errors[:shipping_days_id]).to include('must be other than 1')
    end

    it 'condition_idが1だと保存できない' do
      item = FactoryBot.build(:item, condition_id: '1')
      item.valid?
      expect(item.errors[:condition_id]).to include('must be other than 1')
    end

    it 'prefecture_idが1だと保存できない' do
      item = FactoryBot.build(:item, prefecture_id: '1')
      item.valid?
      expect(item.errors[:prefecture_id]).to include('must be other than 1')
    end

    it 'priceがないと保存できない' do
      item = FactoryBot.build(:item, price: '1')
      item.valid?
      expect(item.errors[:price]).to include('must be greater than or equal to 300')
    end

    it 'priceが299円以下だと保存できない' do
      item = FactoryBot.build(:item, price: '299')
      item.valid?
      expect(item.errors[:price]).to include('must be greater than or equal to 300')
    end

    it 'priceが10000000円以上だと保存できない' do
      item = FactoryBot.build(:item, price: '10000000')
      item.valid?
      expect(item.errors[:price]).to include('must be less than or equal to 9999999')
    end

    it 'priceが半角数字以外だと保存できない' do
      item = FactoryBot.build(:item, price: '１１１１１')
      item.valid?
      expect(item.errors[:price]).to include('is not a number')
    end
  end
end
