class Model < ActiveRecord::Base
  belongs_to  :category
  has_many :photos, :dependent => :destroy

  belongs_to :hair_color, class_name: "Color"
  belongs_to :eyes_color, class_name: "Color"

  accepts_nested_attributes_for :photos
  #, :reject_if => proc { |attributes| attributes['photo']['image']['image_file_size'].blank? }

  attr_accessible :name, :category_id, :photos_attributes, :height, :suit, :neck, :shoe, :waist, :size, :bust, :hips, :hair_color_id, :eyes_color_id

  validates_uniqueness_of :name
  validates_presence_of :name, :on => :create

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
