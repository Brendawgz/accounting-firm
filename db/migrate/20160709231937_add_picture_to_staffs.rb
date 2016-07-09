class AddPictureToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :picture, :string
  end
end
