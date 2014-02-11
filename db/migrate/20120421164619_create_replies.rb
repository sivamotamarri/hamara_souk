class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.references :ad
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.timestamps
    end
  end
end
