class CreateVideoThumbnails < ActiveRecord::Migration
  def up
    create_table :video_thumbnails do |t|
      t.string :video_thumbnail_url
      t.integer :video_id
    end
  end

  def down
  end
end
