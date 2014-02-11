class AddGmapsToAds < ActiveRecord::Migration
  def self.up
    add_column :ads, :gmaps, :boolean
    rename_column :ads, :address, :street
    rename_column :ads, :location, :city
    add_column :ads, :country, :string

  end

  def self.down
    remove_column :ads, :gmaps
    rename_column :ads, :street, :address
    rename_column :ads, :city, :location
    remove_column :ads, :country
  end
end
