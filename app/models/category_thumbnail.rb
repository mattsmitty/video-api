class CategoryThumbnail < ActiveRecord::Base
  belongs_to :category
  attr_accessible :category_id, :category_thumbnail_url
  validates_presence_of :category_id, :category_thumbnail_url
end