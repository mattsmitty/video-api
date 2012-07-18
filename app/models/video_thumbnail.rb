class VideoThumbnail < ActiveRecord::Base
  attr_accessible :video_id, :video_thumbnail_url
  belongs_to :video
end