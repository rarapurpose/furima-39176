class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    #@item = item.new
    
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :item_description, :price).merge(user_id: current_user.id)
  end

end
