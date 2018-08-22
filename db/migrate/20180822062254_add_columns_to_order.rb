class AddColumnsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :state, :string
    add_column :orders, :amount_cents, :integer
    add_column :orders, :payment, :jsonb
  end
end
