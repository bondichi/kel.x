class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_monetize :products, :cost_price, currency: { present: false }
    add_monetize :products, :rrp,  currency: { present: false }
    add_monetize :products, :sale_price, currency: { present: false }
  end
end

