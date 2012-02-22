class CreateWatchings < ActiveRecord::Migration
  def change
    create_table :watchings do |t|
      t.references :user
      t.references :ad
      t.string :ad_title
      t.timestamps
    end
  end
end
