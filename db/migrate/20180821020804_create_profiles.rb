class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :occupation
      t.date :brithday

      t.timestamps
    end
  end
end
