class AddCategoryToTasksAndSubtasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :type
    add_column :tasks, :category, :string
    add_column :subtasks, :category, :string
  end
end
