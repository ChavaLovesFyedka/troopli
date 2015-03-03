class DropLeadersTable < ActiveRecord::Migration
  def up
    drop_table :leaders
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
