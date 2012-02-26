class AddSlugToModels < ActiveRecord::Migration
  def self.up
    add_column :ads ,:slug , :string
    add_column :sections ,:slug , :string
    add_column :categories ,:slug , :string
    add_index :ads, :slug, :unique => true
    add_index :sections, :slug, :unique => true
    add_index :categories, :slug, :unique => true  
    
    Ad.find_each(&:save)
    Section.find_each(&:save)
    Category.find_each(&:save)
  end
  
  def self.down
    remove_column :ads ,:slug , :string
    remove_column :sections ,:slug , :string
    remove_column :categories ,:slug , :string
    remove_index :ads, :slug, :unique => true
    remove_index :sections, :slug, :unique => true
    remove_index :categories, :slug, :unique => true  
  end
end
