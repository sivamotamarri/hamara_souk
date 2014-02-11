class AddUserAndTagsToAds < ActiveRecord::Migration
  def change
    add_column :ads, :user_id, :integer
    add_column :ads, :tags , :string
  end
end
