class RemoveStaffIdAndTaskIdAndImageIdFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :staff_id
    remove_column :teams, :image_id
    remove_column :teams, :task_id
  end
end
