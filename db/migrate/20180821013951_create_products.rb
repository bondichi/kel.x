class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :vpn
      t.string :style
      t.string :sku
      t.bigint :barcode
      t.string :size
      t.integer :neck_circumference
      t.integer :shoulder_width
      t.integer :arm_length
      t.integer :center_back
      t.integer :chest_width
      t.integer :waist_circumference
      t.integer :inner_leg
      t.integer :outer_leg
      t.integer :thigh_circumference
      t.integer :glutes
      t.decimal :cost_price
      t.decimal :rrp
      t.decimal :sale_price
      t.string :photo_id
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
