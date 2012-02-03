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
  
end
