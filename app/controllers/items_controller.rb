class ItemsController < ApplicationController
  #loginしていない場合
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index    
    @items = Item.includes(:user).order('created_at DESC') #昇順/降順
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_description, :detail_category_id, :detail_condition_id, :shipping_option_id, :shipping_prefecture_id, :shipping_period_id, :price).merge(user_id: current_user.id)
  end

end
