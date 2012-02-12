class Amenity < ActiveRecord::Base
  belongs_to :section
  belongs_to :category ,:conditions => "categories.parent_id IS NULL"  
  
  validates :title,:section_id,:category_id,  :presence => true
end
