class Category < ActiveRecord::Base
  attr_accessible :name, :app_id
  has_many :videos
  has_many :category_thumbnails
  belongs_to :app
  validates_presence_of :name, :app_id
end