class UpdatePriceColumnsProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :cost_price, :integer
    change_column :products, :rrp, :integer
    change_column :products, :sale_price, :integer
  end

  def down
    change_column :products, :cost_price, :decimal
    change_column :products, :rrp, :decimal
    change_column :products, :sale_price, :decimal
  end
end

