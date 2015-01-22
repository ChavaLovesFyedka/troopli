class CreateBadgesIdeas < ActiveRecord::Migration
  def change
    create_table :badges_ideas do |t|
      t.references :badge, index: true
      t.references :idea, index: true

      t.timestamps
    end
  end
end
