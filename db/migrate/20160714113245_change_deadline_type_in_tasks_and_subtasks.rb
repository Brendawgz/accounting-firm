class ChangeDeadlineTypeInTasksAndSubtasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :deadline
    remove_column :subtasks, :deadline
    add_column :tasks, :deadline, :date
    add_column :subtasks, :deadline, :date
  end
end
