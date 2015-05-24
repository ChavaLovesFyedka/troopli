class AddImageUrlToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :image_url, :string, default: ''
    add_column :ideas, :description, :text
  end
end
