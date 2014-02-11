class AddSlugToModels < ActiveRecord::Migration
  def self.up
    add_column :ads ,:slug , :string
    add_column :sections ,:slug , :string
    add_column :categories ,:slug , :string
    add_index :ads, :slug
    add_index :sections, :slug
    add_index :categories, :slug 
    
    Ad.find_each(&:save)
    Section.find_each(&:save)
    Category.find_each(&:save)
  end
  
  def self.down
    remove_column :ads ,:slug
    remove_column :sections ,:slug 
    remove_column :categories ,:slug 
    remove_index :ads, :slug
    remove_index :sections, :slug
    remove_index :categories, :slug 
  end
end
