class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  validates :content,:commentable_id, :presence => true
  belongs_to :user
end
