class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.decimal :charge
      t.string :type
      t.datetime :deadline
      t.decimal :completion
      t.string :comments
      t.integer :team_id
      t.integer :client_id
      t.timestamps
    end
  end
end
