class App < ActiveRecord::Base
  attr_accessible :name
  has_many :categories
  validates_presence_of :name
end