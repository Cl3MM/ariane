class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "313x450>", :thumb => "119x170>" }

  belongs_to :model
  attr_accessible :model_id, :name
end
