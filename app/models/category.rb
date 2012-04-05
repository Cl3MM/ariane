class Category < ActiveRecord::Base
  has_many :models
  attr_accessible :name
end
