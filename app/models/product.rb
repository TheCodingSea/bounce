class Product < ActiveRecord::Base
  has_many :line_items
  has_many :rentals
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  #set photo size
end
