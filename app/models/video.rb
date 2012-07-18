class Video < ActiveRecord::Base
  attr_accessible :name, :video_url, :duration, :category_id
  belongs_to :category
  has_many :video_thumbnails

  before_save do |record|
    if record.video_url.include?("you")
      client = YouTubeIt::Client.new
      video_meta = client.video_by(record.video_url.split("/").last)
      record.duration = format_time(video_meta.duration)
      thumbnails = video_meta.thumbnails
      thumbnails.each do |t|
        record.video_thumbnails.create(:video_thumbnail_url => t.url)
      end
    elsif record.video_url.include?("vimeo")
      video_meta = Vimeo::Simple::Video.info(record.video_url.split("/").last)
      record.duration = format_time(video_meta[0]["duration"])
      record.video_thumbnails.create(:video_thumbnail_url => video_meta[0]["thumbnail_small"])
      record.video_thumbnails.create(:video_thumbnail_url => video_meta[0]["thumbnail_medium"])
      record.video_thumbnails.create(:video_thumbnail_url => video_meta[0]["thumbnail_large"])
    end
  end

  def format_time (timeElapsed)   
    @timeElapsed = timeElapsed    
    seconds = @timeElapsed % 60    
    minutes = (@timeElapsed / 60) % 60    
    hours = (@timeElapsed/3600)    
    hours.to_s + ":" + format("%02d",minutes.to_s) + ":" + format("%02d",seconds.to_s)
  end
end