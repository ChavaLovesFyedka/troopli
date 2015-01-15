class CreateTroops < ActiveRecord::Migration
  def change
    create_table :troops do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :age_level

      t.timestamps
    end
  end
end
