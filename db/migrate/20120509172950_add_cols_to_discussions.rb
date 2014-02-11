class AddColsToDiscussions < ActiveRecord::Migration
  def self.up
    add_column :forums ,:slug , :string
    add_column :topics ,:slug , :string    
  end
  def self.down
    remove_column :forums ,:slug 
    remove_column :topics ,:slug 
  end
end
