class AddAmenitiesData < ActiveRecord::Migration
  def up
   Amenity.create(:title => 'Balcony',:section_id =>2,:category_id => 3,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Built in Kitchen Appliances',:section_id =>2,:category_id => 3,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Built in Wardrobes',:section_id =>2,:category_id => 3,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Central A/C & Heating',:section_id =>2,:category_id => 3,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Covered Parking',:section_id =>2,:category_id => 3,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Maids Room',:section_id =>2,:category_id => 3,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Shared Pool',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )
     Amenity.create(:title => 'Balcony',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Built in Kitchen Appliances',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Built in Wardrobes',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Central A/C & Heating',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Covered Parking',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Maids Room',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )
  Amenity.create(:title => 'Shared Pool',:section_id =>2,:category_id => 4,
    :created_at => Time.now,
    :updated_at => Time.now )

  end

  def down
    Amenity.delete_all
  end
end
