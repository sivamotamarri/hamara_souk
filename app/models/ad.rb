class Ad < ActiveRecord::Base
#attr_accessible :section_id, :category_id
  attr_writer :current_step
  belongs_to :section
  belongs_to :user
  belongs_to :category
  has_many :replies
  belongs_to :sub_category , :class_name => "Category", :foreign_key => :sub_category_id

  extend FriendlyId
  friendly_id :title, :use => :slugged

  acts_as_gmappable :validation => lambda { |u| u.current_step == "find_on_map" }

  has_many :images, :as => :assetable, :class_name => "Ad::Image", :dependent => :destroy

  accepts_nested_attributes_for :images

  
  NUMBER = ['1','2','3','4','5','6','7','8','9','10','11','12+']
  
  WORK_EXPERIENCE = {"UN" => "Unspecified",
"00" => "0-1 Years" ,
"01" => "1-2 Years",
"02" => "2-5 Years",
"05" => "5-10 Years",
"10" => "10-15 Years",
"15" => "15+ Years"}

  EDUCATION_LEVEL = {"UN" => "Unspecified",
"HS"=>"High-School / Secondary School",
"BD"=>"Bachelors Degree",
"MD"=>"Masters Degree",
"PH" =>"PhD"
  }
  PRODUCT_AGE = {"Brand New" => "Brand New",
    "0-1 month" => "0-1 month" ,
    "1-6 months" => "1-6 months" ,
    "6-12 months" => "6-12 months" ,
    "1-2 years" => "1-2 years" ,
    "2-5 years" => "2-5 years",
    "5-10 years" => "5-10 years" ,
    "10+ years" => "10+ years"  }
  
  USAGE = {"Still in original packaging" => "Still in original packaging",
    "Out of original packaging, but only used once" => "Out of original packaging, but only used once",
   "Used only a few times" => "Used only a few times" ,
"Used an average amount, as frequently as would be expected" => "Used an average amount, as frequently as would be expected",
"Used an above average amount since purchased" => "Used an above average amount since purchased"
  }
AD_CONDITION = {"Perfect inside and out" => "Perfect inside and out",
  "Almost no noticeable problems or flaws" => "Almost no noticeable problems or flaws",
  "A bit of wear and tear, but in good working condition" => "A bit of wear and tear, but in good working condition",
  "Normal wear and tear for the age of the item, a few problems here and there" => "Normal wear and tear for the age of the item, a few problems here and there" ,
  "Above average wear and tear. The item may need a bit of repair to work properly" => "Above average wear and tear. The item may need a bit of repair to work properly"  
}


  validates :section_id,:category_id, :presence => true , :if => lambda { |o| o.current_step == "categories" }
  validates :section_id,:category_id, :presence => true , :if => lambda { |o| o.current_step == "categories" }
  validates :title , :ad_age, :ad_usage ,:ad_condition, :warranty , :price,:desc, :presence => true , :if => lambda { |o| o.current_step == "details"  && o.section_id == 1 }
  validates :title , :size , :fee ,:bed_rooms, :bath_rooms , :developer ,:ready_date, :annual_comm_fee, :amenities, :presence => true , :if => lambda { |o| (o.current_step == "details"  && (o.section_id != 2 || o.section_id == 3)) }
  validates :title , :compensation, :work_experience ,:education_level, :commitment , :desc, :presence => true , :if => lambda { |o| o.current_step == "details"  && o.section_id == 4 }
  validates :title , :desc, :presence => true , :if => lambda { |o| o.current_step == "details"  && o.section_id == 1 }
  validates :street , :city, :country, :presence => true , :if => lambda { |o| o.current_step == "find_on_map" }



  scope :category_ads, lambda {|sec_id,cat_id|
    where("ads.section_id = ? && ads.category_id = ?", sec_id ,cat_id)
  }
  

#  searchable do
#    text :title
#  end

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
    %w[categories agree_to_terms details find_on_map images]
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
=begin  
  
  +------------------------+---------------+------+-----+---------+----------------+
| id                     | int(11)       | NO   | PRI | NULL    | auto_increment |
| title                  | varchar(255)  | YES  | MUL | NULL    |                |
| size                   | decimal(10,0) | YES  |     | NULL    |                |
| fee                    | decimal(10,0) | YES  |     | NULL    |                |
| bed_rooms              | int(11)       | YES  |     | NULL    |                |
| bath_rooms             | int(11)       | YES  |     | NULL    |                |
| developer              | varchar(255)  | YES  |     | NULL    |                |
| ready_date             | date          | YES  |     | NULL    |                |
| annual_comm_fee        | decimal(10,0) | YES  |     | NULL    |                |
| amenities              | varchar(255)  | YES  |     | NULL    |                |
| section_id             | int(11)       | YES  | MUL | NULL    |                |
| category_id            | int(11)       | YES  | MUL | NULL    |                |
| sub_category_id        | int(11)       | YES  |     | NULL    |                |
| price                  | decimal(10,0) | YES  |     | NULL    |                |
| property_refer         | varchar(255)  | YES  |     | NULL    |                |
| phone_number           | int(11)       | YES  |     | NULL    |                |
| desc                   | text          | YES  |     | NULL    |                |
| full_name              | varchar(255)  | YES  |     | NULL    |                |
| company_name           | varchar(255)  | YES  | UNI | NULL    |                |
| broker_id              | varchar(255)  | YES  |     | NULL    |                |
| agent_or_landlord      | tinyint(1)    | YES  |     | NULL    |                |
| complete_or_incomplete | tinyint(1)    | YES  |     | NULL    |                |
| active_status          | tinyint(1)    | YES  |     | NULL    |                |
| street                 | varchar(255)  | YES  |     | NULL    |                |
| city                   | varchar(255)  | YES  |     | NULL    |                |
| longitude              | float         | YES  |     | NULL    |                |
| latitude               | float         | YES  |     | NULL    |                |
| created_at             | datetime      | YES  |     | NULL    |                |
| updated_at             | datetime      | YES  |     | NULL    |                |
| user_id                | int(11)       | YES  | MUL | NULL    |                |
| tags                   | varchar(255)  | YES  |     | NULL    |                |
| gmaps                  | tinyint(1)    | YES  |     | NULL    |                |
| country                | varchar(255)  | YES  |     | NULL    |                |
| slug                   | varchar(255)  | YES  | UNI | NULL    |                |
| listed_by              | varchar(255)  | YES  | UNI | NULL    |                |
| ad_condition           | varchar(255)  | YES  | UNI | NULL    |                |
| compensation           | decimal(10,0) | YES  | UNI | NULL    |                |
| ad_usage               | varchar(255)  | YES  | UNI | NULL    |                |
| ad_age                 | varchar(255)  | YES  | UNI | NULL    |                |
| ad_description         | text          | YES  |     | NULL    |                |
| work_experience        | varchar(255)  | YES  | UNI | NULL    |                |
| education_level        | varchar(255)  | YES  | UNI | NULL    |                |
| commitment             | varchar(255)  | YES  | UNI | NULL    |                |
| brand                  | varchar(255)  | YES  | UNI | NULL    |                |
| warranty               | varchar(255)  | YES  | UNI | NULL    |                |
| type                   | varchar(255)  | YES  | UNI | NULL    |                |
| length                 | varchar(255)  | YES  | UNI | NULL    |                |
+------------------------+---------------+------+-----+---------+----------------+
=end
end
