class Ad < ActiveRecord::Base
#attr_accessible :section_id, :category_id
  attr_writer :current_step
  belongs_to :section
  belongs_to :user
  belongs_to :category
  
  NUMBER = ['1','2','3','4','5','6','7','8','9','10','11','12+']

  validates :section_id,:category_id, :presence => true , :if => lambda { |o| o.current_step == "categories" }
 
  
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[categories agree_to_terms enter_details find_on_map preview_Ad activate_ad]
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
end
