class Watching < ActiveRecord::Base
  belongs_to :user
  belongs_to :ad
end
