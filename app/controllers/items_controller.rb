class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to :root
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :price, :condition_id, :shipping_cost_id, :shipping_days_id, :prefecture_id, :category_id).merge(user_id: current_user.id)
  end
end
