class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :ad_id
      t.string :spam
      t.text :fraud_desc
      t.boolean :miscategorized,        :default => false
      t.boolean :repetitive_listing ,        :default => false
      t.integer :reported_by
      t.timestamps
    end
  end
end
