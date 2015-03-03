class AddLeadershipRequestToMembers < ActiveRecord::Migration
  def change
    add_column :members, :leadership_request, :boolean
  end
end
