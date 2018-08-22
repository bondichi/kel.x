class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :vendor, :string
    add_column :products, :style_number, :string
    add_column :products, :size_code, :string
    add_column :products, :sub_category, :string
    add_column :products, :fabric_composition, :string
    add_column :products, :silhouette, :string
    add_column :products, :main_colour, :string
    add_column :products, :print_wash, :string
  end
end
