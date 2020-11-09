class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item_order = ItemOrder.new 
    @item = Item.find(params[:item_id])
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    @item = Item.find(params[:item_id])
   if @item_order.valid?
    pay_item
    @item_order.save
    redirect_to root_path
   else
    render :index
   end
end

private
def item_order_params
  params.require(:item_order).permit(:postcode, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def pay_item
  Payjp.api_key = "sk_test_62b87419a5408a4739a14fa5"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,  # 商品の値段
      card: item_order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end



end
