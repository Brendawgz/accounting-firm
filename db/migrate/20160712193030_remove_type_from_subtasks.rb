class RemoveTypeFromSubtasks < ActiveRecord::Migration
  def change
    remove_column :subtasks, :type
  end
end
