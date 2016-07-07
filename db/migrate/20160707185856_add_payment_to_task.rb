class AddPaymentToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :paid, :boolean
  end
end
