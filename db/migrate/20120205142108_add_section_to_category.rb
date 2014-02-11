class AddSectionToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :section_id, :integer
  end
end
