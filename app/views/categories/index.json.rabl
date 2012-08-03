object @categories
attributes :id => :category_id, :name => :category_name
node(:video_count) {|c| c.videos.count}
child :category_thumbnails do
  attribute :category_thumbnail_url
end

