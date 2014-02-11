class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.string :title
      t.integer :section_id
      t.integer :category_id
      t.timestamps
    end
  end
end
