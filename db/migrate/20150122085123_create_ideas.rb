class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :category
      t.string :age_level

      t.timestamps
    end
  end
end
