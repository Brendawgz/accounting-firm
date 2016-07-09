class AddStaffIdAndTaskIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :staff_id, :integer
    add_column :teams, :task_id, :integer
    add_column :teams, :image_id, :integer
  end
end
