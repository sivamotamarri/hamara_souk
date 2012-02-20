class Ad < ActiveRecord::Base
#attr_accessible :section_id, :category_id
  attr_writer :current_step
  belongs_to :section
  belongs_to :user
  belongs_to :category

  acts_as_gmappable :validation => lambda { |u| u.current_step == "find_on_map" }


  
  NUMBER = ['1','2','3','4','5','6','7','8','9','10','11','12+']

  validates :section_id,:category_id, :presence => true , :if => lambda { |o| o.current_step == "categories" }
  validates :section_id,:category_id, :presence => true , :if => lambda { |o| o.current_step == "categories" }
  validates :title , :size , :fee ,:bed_rooms, :bath_rooms , :developer ,:ready_date, :annual_comm_fee, :amenities, :price ,
     :desc  , :presence => true , :if => lambda { |o| o.current_step == "details" }
  validates :street , :city, :country, :presence => true , :if => lambda { |o| o.current_step == "find_on_map" }


  def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.street}, #{self.city}, #{self.country}"
  end
  def gmaps4rails_infowindow
      # add here whatever html content you desire, it will be displayed when users clicks on the marker
     "#{self.street}, #{self.city}, #{self.country}"
  end
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[categories agree_to_terms details find_on_map preview_Ad]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
  def published?
    false
  end
end
