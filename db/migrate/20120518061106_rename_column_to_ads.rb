class RenameColumnToAds < ActiveRecord::Migration
  def up
    rename_column :ads , :phone_number , :mobile_number
  end

  def down
    rename_column :ads , :mobile_number , :phone_number
  end
end
