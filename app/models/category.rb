class Category < ActiveRecord::Base
  belongs_to :parent , :class_name => "Category", :foreign_key => "parent_id"
  has_one :category, :through => :parent
  belongs_to :section
  has_many :amenities
  validates :name,:section,:desc,  :presence => true
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  scope :parent_cat, lambda { 
    where("categories.parent_id IS NULL AND categories.status = 1 ")
  }
  scope :child_cat, lambda { |cat_id|
    where("categories.parent_id = ? AND categories.status = 1 ", cat_id)
  }
  scope :section_categories , lambda {|sec_id|
    where("categories.parent_id IS NULL AND categories.status = 1 AND categories.section_id = ?",sec_id)
  }
end
