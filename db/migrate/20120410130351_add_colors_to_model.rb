class AddColorsToModel < ActiveRecord::Migration
  def change
    add_column :models, :hair_color_id, :integer
    add_column :models, :eyes_color_id, :integer
  end
  def self.down
    remove_column :models, :hair_color_id
    remove_column :models, :eyes_color_id
  end

end
