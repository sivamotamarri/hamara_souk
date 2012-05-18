class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad

  validates :rating,:desc, :presence => true
end
