namespace :video_api do
  task :load_video_from_excel => :environment do
    xls = Excel.new("#{Rails.root}/doc/video-list.xls")
    client = YouTubeIt::Client.new
    l=Logger.new("corrupted_video.log")
    118.times do |row|
      current_cell = xls.cell(row+1,"B")
      begin
        unless current_cell.nil?
          if current_cell.include?("you")
            video_meta = client.video_by(current_cell.split("/").last)
            l.debug(current_cell) if video_meta.duration == 0
          end
        end
      rescue Exception => e
        
        l.debug(current_cell)
        l.debug(xls.cell(row+1, "A"))
      end
    end
  end
end