class CreateAdministrationPhotos < ActiveRecord::Migration
  def change
    create_table :administration_photos do |t|

      t.timestamps
    end
  end
end
