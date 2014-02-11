class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :desc
      t.integer :user_id
      t.timestamps
    end
  end
end
