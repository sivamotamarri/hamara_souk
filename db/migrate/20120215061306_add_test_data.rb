class AddTestData < ActiveRecord::Migration
  def up
    Section.create(:name => 'Classifieds',
    :created_at => Time.now,
    :updated_at => Time.now )
   Section.create(:name => 'Property for Sale',
    :created_at => Time.now,
    :updated_at => Time.now )
  Section.create(:name => 'Property for Rent',
    :created_at => Time.now,
    :updated_at => Time.now )
  Section.create(:name => 'Jobs',
    :created_at => Time.now,
    :updated_at => Time.now )
  Section.create(:name => 'Community',
    :created_at => Time.now,
    :updated_at => Time.now )
  Category.create(:name => "Autos/4x4s",:desc => "Autos/4x4s",:section_id => 1 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Baby Items",:desc => "Baby Items",:section_id => 1 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Residential for Sale",:desc => "Residential for Sale",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Commercial for Sale",:desc => "Commercial for Sale",:section_id => 2 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Residential Units for Rent",:desc => "Residential Units for Rent",:section_id => 3 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Commercial for Rent",:desc => "Commercial for Rent",:section_id => 3 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Accounting",:desc => "Accounting",:section_id => 4 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Architecture/Eng",:desc => "Architecture/Eng",:section_id => 4 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
  Category.create(:name => "Activities",:desc => "Activities",:section_id => 5 , :status  => true,:created_at =>Time.now,:updated_at =>Time.now)
 end

  def down
    Category.delete_all
    Section.delete_all
  end
end
