class CreateAgeLevels < ActiveRecord::Migration
  def change
    create_table :age_levels do |t|
      t.string :name

      t.timestamps
    end
  end
end
