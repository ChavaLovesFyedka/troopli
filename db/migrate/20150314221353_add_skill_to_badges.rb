class AddSkillToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :skill, :string
  end
end
