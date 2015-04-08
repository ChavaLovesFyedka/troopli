class AddPictureColumnsToTroops < ActiveRecord::Migration
  def self.up 
    add_attachment :troops, :picture
  end

  def self.down
    remove_attachment :troops, :picture
  end
end
