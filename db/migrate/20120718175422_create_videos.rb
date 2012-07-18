class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.string :name
      t.string :video_url
      t.string :duration
      t.integer :category_id
      t.timestamps
    end
  end

  def down
  end
end
