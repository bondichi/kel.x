class CreateFitTops < ActiveRecord::Migration[5.2]
  def change
    create_table :fit_tops do |t|
      t.integer :neck_circumference
      t.integer :shoulder_width
      t.integer :arm_length
      t.integer :center_back
      t.integer :chest_width

      t.timestamps
    end
  end
end
