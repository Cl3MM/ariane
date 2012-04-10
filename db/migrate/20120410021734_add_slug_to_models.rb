class AddSlugToModels < ActiveRecord::Migration
  def change
    add_column :models, :slug, :string
    add_index :models, :slug
  end
end
