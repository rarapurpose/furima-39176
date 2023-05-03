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

  validates :image,                   presence: true
  validates :item_name,               presence: true
  validates :item_description,        presence: true
  validates :detail_category_id,      presence: true
  validates :detail_condition_id,     presence: true
  validates :shipping_option_id,      presence: true
  validates :shipping_prefecture_id,  presence: true
  validates :shipping_period_id,      presence: true
  validates :price,                   presence: true

  #validates :detail_category_id, numericality: { other_than: 1 , itemcategory: "can't be blank"}

end
