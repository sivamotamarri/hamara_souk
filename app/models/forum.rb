class Forum < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  # Associations
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics
  
  belongs_to :user
  
  # Accessors
  attr_accessible :title, :description, :state, :position, :user_id
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true
  validates :description, :presence => true
  
end