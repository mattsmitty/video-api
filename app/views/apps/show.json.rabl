object @app
attributes :id, :name
child :categories do
  attribute :name
  node(:video_count) {|c| c.videos.count}
  child :category_thumbnails do
    attribute :category_thumbnail_url
  end
  child :videos do
    attribute :name, :video_url
    child :video_thumbnails do
      attribute :video_thumbnail_url
    end
  end
end 