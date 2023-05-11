class CreateOrders < ActiveRecord::Migration[6.0]
  belongs_to : user
  belongs_to : item
  has_one : address

  def change
    create_table :orders do |t|

      t.references :item,       null: false,foreign_key:true
      t.references :user,       null: false,foreign_key:true
      
      t.timestamps
    end
  end
end
