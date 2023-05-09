class OrderForm
  include ActiveModel::Model 
  attr_accessor : user_id, :item_id, :postal_code, :shipping_prefecture_id, :city, :street, :apartment, :phone_number, 

  with_options presence: true do  
  validates :user_id
  validates :item_id
  validates :token
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :shipping_prefecture_id, numericality: { other_than: 0 }
  validates :city
  validates :street
  validates :phone_number, format{ with: /\A[0-9]{11}\z/}

  end
 
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    
  end
 end