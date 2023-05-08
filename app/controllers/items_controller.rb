class ItemsController < ApplicationController
  #loginしていない場合
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    #@item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path  
    end  
  end

  def update
    #@item = Item.find(params[:id])
    @item.update(item_params)
    
    if @item.valid?
      redirect_to item_path(item_params)
    else
      render :edit
    end
  end

 

  def show
    
  end

  

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_description, :detail_category_id, :detail_condition_id, :shipping_option_id, :shipping_prefecture_id, :shipping_period_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
