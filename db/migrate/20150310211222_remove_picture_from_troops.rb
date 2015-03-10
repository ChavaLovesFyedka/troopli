class RemovePictureFromTroops < ActiveRecord::Migration
  def change
    remove_column :troops, :picture, :string
  end
end
