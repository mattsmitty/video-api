class Category < ActiveRecord::Base
  attr_accessible :name, :app_id
  has_many :videos, :dependent => :destroy
  has_many :category_thumbnails, :dependent => :destroy
  belongs_to :app
  validates_presence_of :name, :app_id
end