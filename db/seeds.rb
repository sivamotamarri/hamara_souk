# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

LOCATION_CONFIG.each_pair do |state, locations|
  p "Seeding location data for #{state}"
  if City.find_by_state(state)
    p "Location data already exists for #{state}"
  else
    locations.values.first.each do |location|
      City.create(:name => location , :state => state) unless location.blank?
    end
  end
end

Category.delete_all
Section.delete_all

Section.create(:name => 'Motors', :created_at => Time.now,  :updated_at => Time.now )
Section.create(:name => 'Classifieds', :created_at => Time.now,  :updated_at => Time.now )
Section.create(:name => 'Property for Sale',  :created_at => Time.now,  :updated_at => Time.now )
Section.create(:name => 'Property for Rent', :created_at => Time.now,  :updated_at => Time.now )
Section.create(:name => 'Jobs',:created_at => Time.now,:updated_at => Time.now )
Section.create(:name => 'Community', :created_at => Time.now, :updated_at => Time.now )






Category.create(:name => "Used Cars for Sale",:desc => "Used Cars for Sale",:section_id => 1 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Auto Accessories & Parts",:desc => "Auto Accessories & Parts",:section_id => 1 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Motorcycles",:desc => "Motorcycles",:section_id => 1 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)

Category.create(:name => "Collectibles",:desc => "Collectibles",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Computers & Networking",:desc => "Computers & Networking",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "DVDs & Movies",:desc => "DVDs & Movies",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Electronics",:desc => "Electronics",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Free Stuff",:desc => "Free Stuff",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Baby Items",:desc => "Baby Items",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Books",:desc => "Books",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Business & Industrial",:desc => "Business & Industrial",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Cameras & Imaging",:desc => "Cameras & Imaging",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Clothing & Accessories",:desc => "Clothing & Accessories",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)

Category.create(:name => "Furniture, Home & Garden",:desc => "Furniture, Home & Garden",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Gaming",:desc => "Gaming",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Home Appliances",:desc => "Home Appliances",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Jewelry & Watches",:desc => "Jewelry & Watches",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Lost/Found",:desc => "Lost/Found",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Misc",:desc => "Misc",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Mobile Phones & IPADs",:desc => "Mobile Phones & IPADs",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Music",:desc => "Music",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Musical Instruments",:desc => "Musical Instruments",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Pets",:desc => "Pets",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)

 
Category.create(:name => "Sports Equipment ",:desc => "Sports Equipment ",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Stuff Wanted",:desc => "Stuff Wanted",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Tickets & Vouchers",:desc => "Tickets & Vouchers",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Toys",:desc => "Toys",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)




Category.create(:name => "Residential for Sale",:desc => "Residential for Sale",:section_id =>3 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Commercial for Sale",:desc => "Commercial for Sale",:section_id => 3 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Residential Units for Rent",:desc => "Residential Units for Rent",:section_id => 4 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Commercial for Rent",:desc => "Commercial for Rent",:section_id => 4 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Accounting",:desc => "Accounting",:section_id => 5 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Architecture/Eng",:desc => "Architecture/Eng",:section_id => 5 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Activities",:desc => "Activities",:section_id => 6 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)


