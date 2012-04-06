class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "313x450>", :thumb => "119x170>" },

               :path => ":rails_root/public/system/:id/:style/:basename.:extension"

  validates_attachment_size :image, :less_than => 10.megabytes
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  belongs_to :model
  attr_accessible :model_id, :name, :image
end
