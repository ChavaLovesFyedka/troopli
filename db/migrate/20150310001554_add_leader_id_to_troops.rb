class AddLeaderIdToTroops < ActiveRecord::Migration
  def change
    add_column :troops, :leader_id, :integer
  end
end
