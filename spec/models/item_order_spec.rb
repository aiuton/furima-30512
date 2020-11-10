require 'rails_helper'

describe ItemOrder, type: :model do
  before do
    item_order = FactoryBot.build(:item_order)
  end

  describe '購入情報の保存' do
    context '商品データが保存される場合' do
      it '全て入力すると保存できること' do
        expect(item_order).to be_valid
      end
    end

    context '商品データが保存されない場合' do
      it 'postcodeが空ならNG' do
        item_order.postcode: ''
        item_order.valid?
        expect(item_order.errors[:postcode]).to include("can't be blank")
      end

      it 'postocodeが意図しない形ならNG（ハイフンなし）' do
        item_order.postcode: '1111111'
        item_order.valid?
        expect(item_order.errors[:postcode]).to include('is invalid')
      end

      it 'prefecture_idが1だとNG' do
        item_order.prefecture_id: '1'
        item_order.valid?
        expect(item_order.errors[:prefecture_id]).to include('must be other than 1')
      end
      it 'cityが空だとNG' do
        item_order.city: ''
        item_order.valid?
        expect(item_order.errors[:city]).to include("can't be blank")
      end
      it 'street_addressがが空だとNG' do
        item_order.street_address: ''
        item_order.valid?
        expect(item_order.errors[:street_address]).to include("can't be blank")
      end

      it 'phone_numberが空だとNG' do
        item_order.phone_number: ''
        item_order.valid?
        expect(item_order.errors[:phone_number]).to include("can't be blank")
      end
      it 'phone_numberが意図しない形ならNG（ハイフンあり）' do
        item_order.phone_number: '090-1234-5678'
        item_order.valid?
        expect(item_order.errors[:phone_number]).to include('is invalid')
      end

      it 'phone_numberが意図しない形ならNG（12桁）' do
        item_order.phone_number: '090123456789'
        item_order.valid?
        expect(item_order.errors[:phone_number]).to include('is invalid')
      end

      it 'tokenが空だとNG' do
        item_order.token: ''
        item_order.valid?
        expect(item_order.errors[:token]).to include("can't be blank")
      end
    end
  end
end
