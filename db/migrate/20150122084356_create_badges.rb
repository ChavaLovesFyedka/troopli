class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :category
      t.string :age_level
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
