class Photo < ActiveRecord::Base
#  has_attached_file :image, :styles => { :cover => ["119x170#", :png], :thumb => ["90x60#", :png]  }
               # ,
               #:url => ":rails_root/public/system/:id/:style/:basename.:extension",
               #:path => ":rails_root/public/system/:id/:style/:basename.:extension"
  has_attached_file :image,
                    :styles => { :cover => ["119x170#", :jpg], :thumb => ["90x60#", :jpg], :medium => ["x106", :jpg],  },
                    :convert_options => {:medium => "-resize x106"},
      #:path => ":rails_root/public/system/:id/:style/:basename.:extension"
      #:path => ":rails_root/public/:attachment/:id/:style/:basename.:extension",
      #:url => "/:attachment/:id/:style/:basename.:extension"
      :path => ":rails_root/public/:attachment/:hash.:extension",
      :url => "/:attachment/:hash.:extension",
      :hash_data => ":class/:attachment/:id/:style/:updated_at",
      :hash_secret => "longSecretStringToChange"

  validates_attachment_size :image, :less_than => 4.megabytes
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  belongs_to :model
  attr_accessible :model_id, :name, :image
end
