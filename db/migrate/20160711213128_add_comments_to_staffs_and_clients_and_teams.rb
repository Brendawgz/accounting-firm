class AddCommentsToStaffsAndClientsAndTeams < ActiveRecord::Migration
  def change
    add_column :staffs, :comments, :string
    add_column :clients, :comments, :string
    add_column :teams, :comments, :string
  end
end
