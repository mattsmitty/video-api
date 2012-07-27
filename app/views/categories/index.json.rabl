object @categories
attributes :id => :category_id, :name => :category_name
child :category_thumbnails do
  attribute :category_thumbnail_url
end

