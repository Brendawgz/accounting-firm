class AddTeamIdToStaffs < ActiveRecord::Migration
  def change
    add_reference :staffs, :team, index: true, foreign_key: true
  end
end
