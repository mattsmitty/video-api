class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :videos
  has_many :category_thumbnails
end