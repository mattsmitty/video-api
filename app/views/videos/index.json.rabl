object @videos
attributes :id => :video_id, :name => :video_name,:duration => :duration
child :video_thumbnails do
  attribute :video_thumbnail_url
end
