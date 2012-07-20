class Video < ActiveRecord::Base
  attr_accessible :name, :video_url, :duration, :category_id
  belongs_to :category
  has_many :video_thumbnails, :dependent => :destroy
  validates_presence_of :name, :video_url, :category_id

  def get_meta_youtube(url)
    client = YouTubeIt::Client.new
    client.video_by(url.split("/").last)
  end

  def get_meta_vimeo(url)
    video_meta = Vimeo::Simple::Video.info(url.split("/").last)
  end


  before_save do |record|
    if record.duration.nil?
      if record.video_url.include?("you")
        video_meta = get_meta_youtube(record.video_url)
        record.duration = format_time(video_meta.duration)
      elsif record.video_url.include?("vimeo")
        video_meta = get_meta_vimeo(record.video_url)
        record.duration = format_time(video_meta[0]["duration"])
      end
    end
  end

  after_save do |record|
    if record.video_thumbnails.empty?
      if record.video_url.include?("you")
        video_meta = get_meta_youtube(record.video_url)
        thumbnails = video_meta.thumbnails
        thumbnails.each do |t|
          record.video_thumbnails.create(:video_thumbnail_url => t.url)
        end
      elsif record.video_url.include?("vimeo")
        video_meta = get_meta_vimeo(record.video_url)
        record.video_thumbnails.find_or_create_by_video_thumbnail_url(:video_thumbnail_url => video_meta[0]["thumbnail_small"])
        record.video_thumbnails.create(:video_thumbnail_url => video_meta[0]["thumbnail_medium"])
        record.video_thumbnails.create(:video_thumbnail_url => video_meta[0]["thumbnail_large"])
      end
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