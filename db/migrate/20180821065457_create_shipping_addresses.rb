class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :number
      t.string :street
      t.string :suburb
      t.string :city
      t.string :state
      t.references :profile, foreign_key: true
      t.string :special

      t.timestamps
    end
  end
end
