class Category < ActiveRecord::Base
  belongs_to :parent , :class_name => "Category", :foreign_key => "parent_id"
  has_one :category, :through => :parent
  belongs_to :section
  validates :name,:section,:desc,  :presence => true
end
