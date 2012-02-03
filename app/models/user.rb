class User < ActiveRecord::Base
  devise :omniauthable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:first_name,:allow_adv, :hamara_souk_updates, :last_name ,:gender,:country,:dob,:professional
  validates :first_name, :last_name ,:gender,:country,:dob,:professional,  :presence => true
  
  
  PROFESSIONALS = {
"Student" => "ST",
"Entry Level Professional" => "EP",
"Professional" =>"PO",
"Manager" => "MM",
"Senior Manager" => "SM",
"G.M/Chief Officer/Proprietor" => "GM"    
  }
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
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
  
end
