class Model < ActiveRecord::Base
  belongs_to  :category
  has_many :photos

#  accepts_nested_attributes_for :category
  attr_accessible :name, :category_id

end
