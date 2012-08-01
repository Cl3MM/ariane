class Category < ActiveRecord::Base
  has_many :models
  attr_accessible :name

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
