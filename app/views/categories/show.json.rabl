object @category
attributes :id, :name
node(:video_count) {|c| c.videos.count}
child :category_thumbnails do
  attribute :category_thumbnail_url
end
