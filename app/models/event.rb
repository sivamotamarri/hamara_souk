class Event < ActiveRecord::Base
    has_many :images, :as => :assetable, :class_name => "Ad::Image", :dependent => :destroy
    accepts_nested_attributes_for :images, :allow_destroy => true
    validates :title,:desc, :presence => true
end
