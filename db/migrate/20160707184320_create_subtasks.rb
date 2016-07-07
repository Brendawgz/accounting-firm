class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :name
      t.string :type
      t.datetime :deadline
      t.decimal :completion
      t.string :comments
      t.integer :task_id
      t.integer :staff_id
      t.timestamps
    end
  end
end
