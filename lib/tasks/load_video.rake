namespace :video_api do
  task :load_video_from_excel => :environment do
    xls = Excel.new("#{Rails.root}/doc/video-list.xls")
    client = YouTubeIt::Client.new
    118.times do |row|
      cell_url = xls.cell(row+1,"B")
      cell_name = xls.cell(row+1, "A")
      begin
        if !cell_url.nil? && !cell_name.nil?
          Video.create!(:name => cell_name, :video_url => cell_url, :category_id => Category.last.id)
        elsif !cell_name.nil? && cell_url.nil?
          Category.create(:name => cell_name, :app_id => App.last.id)
        end
      rescue
        next
      end
    end
  end
end