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

Section.create(:name => 'Classifieds', :created_at => Time.now,  :updated_at => Time.now )
Section.create(:name => 'Property for Sale',  :created_at => Time.now,  :updated_at => Time.now )
Section.create(:name => 'Property for Rent', :created_at => Time.now,  :updated_at => Time.now )
Section.create(:name => 'Jobs',:created_at => Time.now,:updated_at => Time.now )
Section.create(:name => 'Community', :created_at => Time.now, :updated_at => Time.now )

Category.create(:name => "Autos/4x4s",:desc => "Autos/4x4s",:section_id => 1 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Baby Items",:desc => "Baby Items",:section_id => 1 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Residential for Sale",:desc => "Residential for Sale",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Commercial for Sale",:desc => "Commercial for Sale",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Residential Units for Rent",:desc => "Residential Units for Rent",:section_id => 3 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Commercial for Rent",:desc => "Commercial for Rent",:section_id => 3 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Accounting",:desc => "Accounting",:section_id => 4 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Architecture/Eng",:desc => "Architecture/Eng",:section_id => 4 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
Category.create(:name => "Activities",:desc => "Activities",:section_id => 5 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)


