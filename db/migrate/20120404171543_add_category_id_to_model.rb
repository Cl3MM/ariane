class AddCategoryIdToModel < ActiveRecord::Migration
  def change
    add_column :models, :category_id, :integer
  end
end
