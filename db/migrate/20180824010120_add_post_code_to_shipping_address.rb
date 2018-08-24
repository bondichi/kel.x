class AddPostCodeToShippingAddress < ActiveRecord::Migration[5.2]
  def change
  	add_column :shipping_addresses, :post_code, :integer
  end
end
