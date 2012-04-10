class AddDetailsToModels < ActiveRecord::Migration
  def change
    add_column :models, :height, :string
    add_column :models, :suit, :string
    add_column :models, :neck, :string
    add_column :models, :shoe, :string
    add_column :models, :waist, :string
    add_column :models, :size, :string
    add_column :models, :bust, :string
    add_column :models, :hips, :string
  end

  def self.down
    remove_column :models, :height
    remove_column :models, :suit
    remove_column :models, :neck
    remove_column :models, :shoe
    remove_column :models, :waist
    remove_column :models, :size
    remove_column :models, :bust
    remove_column :models, :hips
  end

end
