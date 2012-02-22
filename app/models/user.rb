class User < ActiveRecord::Base
  devise :omniauthable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:allow_adv, :hamara_souk_updates, :last_name ,:gender,:country,:dob,:professional, :avatar, :avatar_content_type, :avatar_file_size
  validates :first_name, :last_name ,:gender,:country,:dob,:professional,  :presence => {:if => :not_facebook?}
  
  has_many :ads
  has_many :watchings
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" }
                               
  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png image/gif), :message => 'must be of type jpeg, png or gif', :if => :photo_attached?
  validates_attachment_size :avatar, :less_than => 3.megabytes, :message => 'cannot be greater than 3 MB', :if => :photo_attached?

  
  
  PROFESSIONALS = {
"Student" => "ST",
"Entry Level Professional" => "EP",
"Professional" =>"PO",
"Manager" => "MM",
"Senior Manager" => "SM",
"G.M/Chief Officer/Proprietor" => "GM"    
  }
  
  def self.find_for_facebook_oauth(access_token, action, signed_in_resource=nil)
    @allow = true
    if action == "facebook"
      @allow = false
    end

    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  def photo_attached?
    self.avatar.file?
  end
  
  def not_facebook?
    return @allow
  end
  
end
