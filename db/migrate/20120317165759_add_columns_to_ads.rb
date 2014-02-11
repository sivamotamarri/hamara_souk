class AddColumnsToAds < ActiveRecord::Migration
  def self.up
    add_column :ads ,:listed_by , :string
    add_column :ads ,:ad_condition , :string
    add_column :ads ,:compensation , :decimal
    add_column :ads, :ad_usage ,  :string    
    add_column :ads,:ad_age , :string
    add_column :ads,:ad_description , :text
    add_column :ads,:work_experience , :string
    add_column :ads,:education_level,:string
    add_column :ads,:commitment, :string
    add_column :ads,:brand , :string
    add_column :ads,:warranty , :string
    add_column :ads, :type , :string
    add_column :ads, :length , :string
    
    add_index :ads ,:listed_by
    add_index :ads ,:ad_condition
    add_index :ads ,:compensation
    add_index :ads, :ad_usage 
    add_index :ads,:company_name
    add_index :ads,:ad_age    
    add_index :ads,:work_experience
    add_index :ads,:education_level
    add_index :ads,:commitment
    add_index :ads,:brand 
    add_index :ads,:warranty
    add_index :ads, :type 
    add_index :ads, :length
  end
  
  def self.down
    remove_column :ads ,:listed_by 
    remove_column :ads ,:ad_condition 
    remove_column :ads ,:compensation
    remove_column :ads, :ad_usage  
    remove_column :ads,:ad_age
    remove_column :ads,:ad_description
    remove_column :ads,:work_experience
    remove_column :ads,:education_level
    remove_column :ads,:commitment
    remove_column :ads,:brand
    remove_column :ads,:warranty
    remove_column :ads, :type
    remove_column :ads, :length
    
    remove_index :ads ,:listed_by 
    remove_index :ads ,:ad_condition 
    remove_index :ads ,:compensation 
    remove_index :ads, :ad_usage 
    remove_index :ads,:company_name
    remove_index :ads,:ad_age  
    remove_index :ads,:work_experience 
    remove_index :ads,:education_level
    remove_index :ads,:commitment
    remove_index:ads,:brand 
    remove_index :ads,:warranty
    remove_index :ads, :type
    remove_index :ads, :length  
  end
end
