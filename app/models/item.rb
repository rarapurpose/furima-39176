class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #table
  belongs_to :user

  #ActiveHash
  belongs_to :detail_category 
  belongs_to :detail_condition
  belongs_to :shipping_option 
  belongs_to :shipping_prefecture
  belongs_to :shipping_period 

  #active_storage
  has_one_attached :image   

  with_options presence: true do
  validates :user_id
  validates :image                   
  validates :item_name               
  validates :item_description        
  validates :detail_category_id      
  validates :detail_condition_id     
  validates :shipping_option_id      
  validates :shipping_prefecture_id  
  validates :shipping_period_id      
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :detail_category_id
    validates :detail_condition_id
    validates :shipping_option_id
    validates :shipping_prefecture_id
    validates :shipping_period_id
  end

end
