class Section < ActiveRecord::Base
  has_many :categories
  has_many :ads
  has_many :amenities
  validates :name,  :presence => true
end
