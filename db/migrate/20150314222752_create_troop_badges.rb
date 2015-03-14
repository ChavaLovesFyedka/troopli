class CreateTroopBadges < ActiveRecord::Migration
  def change
    create_table :troop_badges do |t|
      t.integer :troop_id
      t.integer :badge_id
      t.timestamps
    end
  end
end
