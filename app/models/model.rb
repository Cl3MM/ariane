class Model < ActiveRecord::Base
  belongs_to  :category
  has_many :photos, :dependent => :destroy

  accepts_nested_attributes_for :photos
  #, :reject_if => proc { |attributes| attributes['photo']['image']['image_file_size'].blank? }

  attr_accessible :name, :category_id, :photos_attributes

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
