class AddIndexesToAds < ActiveRecord::Migration
  def change
    add_index :ads, :section_id
    add_index :ads, :category_id
    add_index :ads, :user_id
    add_index :ads, :title
  end
end
