class ItemOrder
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id,  :token


  with_options presence: true do
  validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :phone_number, format: {with:  /\A\d{10}$|^\d{11}\z/}
  validates :token
  validates :city
  validates :street_address

end

def save 
order = Order.create(user_id: user_id, item_id: item_id)
# 履歴の情報を保存
Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id )
# 住所の情報を保存
end
end