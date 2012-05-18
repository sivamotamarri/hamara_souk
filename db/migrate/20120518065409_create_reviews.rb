class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :ad_id
      t.integer :user_id
      t.text :desc
      t.integer :rating
      t.integer :pricing      
      t.string :delivery,       :default => "Dont know"
      t.string :outdoor_dining,       :default => "Dont know"
      t.string :take_out , :default => "Dont know"
      t.timestamps
    end
  end
end
