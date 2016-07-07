class AddAdminToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :admin, :boolean, default: false
    add_column :staffs, :team_leader, :boolean, default: false
  end
end