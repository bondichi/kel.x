class CreateFitBottoms < ActiveRecord::Migration[5.2]
  def change
    create_table :fit_bottoms do |t|
      t.integer :waist_circumference
      t.integer :inner_leg
      t.integer :outer_leg
      t.integer :thigh_circumference
      t.integer :glutes

      t.timestamps
    end
  end
end
