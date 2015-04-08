class AddTroopIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :troop_id, :integer
  end
end
