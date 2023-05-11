class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_item, only: [:index, :create]
  

  def index
    @order_address = OrderAddress.new    
  end

  def create        
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_prefecture_id, :city, :street, :apartment, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
     )
  end
  
  def non_item
    @item = Item.find(params[:item_id])
    
    if current_user.id == @item.user_id || @item.order.present?         
    redirect_to root_path
    end
  end
end
