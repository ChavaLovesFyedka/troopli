class AddSkillToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :skill, :string
  end
end
