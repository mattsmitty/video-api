class App < ActiveRecord::Base
  attr_accessible :name
  has_many :categories, :dependent => :destroy
  validates_presence_of :name
end