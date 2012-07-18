class CreateCategoryThumbnails < ActiveRecord::Migration
  def up
    create_table :category_thumbnails do |t|
      t.string :category_thumbnail_url
      t.integer :category_id
    end
  end

  def down
  end
end
