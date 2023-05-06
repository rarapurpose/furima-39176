class ItemsController < ApplicationController
  #loginしていない場合
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index    
     @items = Item.includes(:user).order('created_at DESC') #昇順/降順
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    #@item.update(item_params)
  end

  def show
    @item = Item.find(params[:id])

  end





  

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_description, :detail_category_id, :detail_condition_id, :shipping_option_id, :shipping_prefecture_id, :shipping_period_id, :price).merge(user_id: current_user.id)
  end

end
