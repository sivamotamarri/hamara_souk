class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state    
    end
#    FasterCSV.foreach("#{Rails.root}/lib/load_database/cities.csv") do |line|
#      City.create(:id => line[0], :name => line[1], :state => line[2])
#    end
  end
end
