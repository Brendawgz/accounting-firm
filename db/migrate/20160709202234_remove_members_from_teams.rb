class RemoveMembersFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :members
  end
end
