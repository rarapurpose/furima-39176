class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.references :order,                   null: false,foreign_key:true
      t.string     :postal_code,             null: false
      t.integer    :shipping_prefecture_id,  null: false
      t.string     :city,                    null: false
      t.string     :street,                  null: false
      t.string     :apartment
      t.string     :phone_number,            null: false

      t.timestamps
    end
  end
end
