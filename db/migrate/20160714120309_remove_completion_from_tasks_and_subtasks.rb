class RemoveCompletionFromTasksAndSubtasks < ActiveRecord::Migration
  def change
    remove_column :subtasks, :completion
    remove_column :tasks, :completion
  end
end
