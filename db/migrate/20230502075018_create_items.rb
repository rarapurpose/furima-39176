class CreateItems < ActiveRecord::Migration[6.0]
  belongs_to: user
  has_one: order

  def change
    create_table :items do |t|

      t.string  :item_name,              null: false
      t.text    :item_description,       null: false
      t.integer :detail_category_id,     null: false
      t.integer :detail_condition_id,    null: false
      t.integer :shipping_option_id,     null: false
      t.integer :shipping_prefecture_id, null: false
      t.integer :shipping_period_id,     null: false
      t.integer :price,                  null: false
      t.references :user,                null: false, foreign_key:true

      t.timestamps
    end
  end
end

