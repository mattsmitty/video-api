object @video
attributes :id => :video_id, :name => :video_name, :duration => :duration
child :video_thumbnails do
  attribute :video_thumbnail_url
end

child @video.category do
  attribute :name => :category_name, :id => :category_id
end
  