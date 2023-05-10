class OrderAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :postal_code, :shipping_prefecture_id, :city, :street, :apartment, :phone_number, :token

  with_options presence: true do  
  validates :user_id
  validates :item_id
  validates :token
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は半角「ハイフン表示」で入力してください'}
  validates :shipping_prefecture_id, numericality: { other_than: 0 }
  validates :city
  validates :street  
  validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: 'は半角「ハイフンなし」で入力してください'}

  end
 
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order_id, postal_code: postal_code, shipping_prefecture_id: shipping_prefecture_id, city: city, street: street, apartment: apartmente, phone_number: phone_number)
    
  end
 end