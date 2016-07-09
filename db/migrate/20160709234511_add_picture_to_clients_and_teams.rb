class AddPictureToClientsAndTeams < ActiveRecord::Migration
  def change
    add_column :teams, :picture, :string
    add_column :clients, :picture, :string
  end
end
