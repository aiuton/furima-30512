require 'rails_helper'
describe Destination do
  describe '#create' do
    it 'postcodeが空なら保存できない' do
      destination = FactoryBot.build(:destination, postcode: '')
      destination.valid?
      expect(destination.errors[:postcode]).to include("can't be blank")
    end
  end
end

# it "postal_codeが意図しない形ならNG（全角）" do
#   address = build(:address, postal_code: "１１１ー１１１１")
#   address.valid?
#   expect(address.errors[:postal_code]).to include("は不正な値です")
# end
# it "postal_codeが意図しない形ならNG（ハイフンなし）" do
#   address = build(:address, postal_code: "1111111")
#   address.valid?
#   expect(address.errors[:postal_code]).to include("は不正な値です")
# end
# it "prefectureが空ならNG" do
#   address = build(:address, prefecture: nil)
#   address.valid?
#   expect(address.errors[:prefecture]).to include("を入力してください")
# end
# it "cityが空ならNG" do
#   address = build(:address, city: nil)
#   address.valid?
#   expect(address.errors[:city]).to include("を入力してください")
# end
# it "addressが空ならNG" do
#   address = build(:address, address: nil)
#   address.valid?
#   expect(address.errors[:address]).to include("を入力してください")
# end

# require 'rails_helper'

# RSpec.describe Destination, type: :model do

#   describe '#create' do
#     # nul:false, presence: true のテスト ▼

#     it 'postcodeがないと保存できない' do
#       destination = FactoryBot.build(:destination, postcode: '')
#       destination.valid?
#       expect(destination.errors[:postcode]).to include("can't be blank")
#     end

#     it 'prefecture_idが1だと保存できない' do
#       destination = FactoryBot.build(:destination, prefecture_id: '1')
#       destination.valid?
#       expect(destination.errors[:prefecture_id]).to include("can't be blank")
#     end

#     it 'cityがないと保存できない' do
#       destination = FactoryBot.build(:destination, city: '')
#       destination.valid?
#       expect(destination.errors[:city]).to include("can't be blank")
#     end

#     it 'street_addressがないと保存できない' do
#       destination = FactoryBot.build(:destination, street_address: '')
#       destination.valid?
#       expect(destination.errors[:street_address]).to include("can't be blank")
#     end

#     it 'phone_numberがないと保存できない' do
#       destination = FactoryBot.build(destination, phone_number: '')
#       destination.valid?
#       expect(destination,errors[:phone_number]).to include("can't be blank")
#     end

#   end
# end
