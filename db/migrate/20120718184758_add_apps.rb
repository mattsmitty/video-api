class AddApps < ActiveRecord::Migration
  def up
    create_table :apps do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
  end
end
