class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.decimal :size
      t.decimal :fee
      t.integer :bed_rooms
      t.integer :bath_rooms
      t.string :developer
      t.date :ready_date
      t.decimal :annual_comm_fee
      t.string :amenities
      t.integer :section_id
      t.integer :category_id
      t.integer :sub_category_id
      t.decimal :price
      t.string :property_refer
      t.integer :phone_number
      t.text :desc
      t.string :full_name
      t.string :company_name
      t.string :broker_id
      t.boolean :agent_or_landlord
      t.boolean :complete_or_incomplete
      t.boolean :active_status
      t.string :address
      t.string :location
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end
end
