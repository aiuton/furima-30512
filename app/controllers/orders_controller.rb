class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
    move_to_index
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    @item = Item.find(params[:item_id])
    move_to_index
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price, # 商品の値段
      card: item_order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  
end
