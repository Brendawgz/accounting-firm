class AddClientIdAndTeamIdToImages < ActiveRecord::Migration
  def change
    add_reference :images, :client, index: true, foreign_key: true
    add_reference :images, :team, index: true, foreign_key: true
  end
end
