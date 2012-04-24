class Photo < ActiveRecord::Base

  has_attached_file :image,
                    :styles => { :cover => ["119x170#", :jpg], :thumb => ["60x40", :jpg],
                                 :medium => ["x106", :jpg], :large => ["600x400", :jpg]
                                },
                    :convert_options => { :medium => "-resize 'x106'",
                                          :large => "-resize '600x400' -background '#eee' \
                                          -gravity center -extent '600x400' -quality 55",
                                          :cover => "-resize '119x170' -background '#eee'\
                                          -gravity center -quality 55",
                                          :thumb => "-resize '60x40' -background '#eee' \
                                          -gravity center -extent '60x40' -quality 55"
                                        },
      #:path => ":rails_root/public/system/:id/:style/:basename.:extension"
      #:path => ":rails_root/public/:attachment/:id/:style/:basename.:extension",
      #:url => "/:attachment/:id/:style/:basename.:extension"
      :path => ":rails_root/public/:attachment/:hash.:extension",
      :url => "/:attachment/:hash.:extension",
      :hash_data => ":class/:attachment/:id/:style/:updated_at",
      :hash_secret => "3Y114164bW3347Fz7C4u4SQ86douka"

  validates_attachment_size :image, :less_than => 4.megabytes
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

  belongs_to :model
  attr_accessible :model_id, :name, :image
end
