class AddAppIdToCategories < ActiveRecord::Migration
  def up
    add_column :categories, :app_id, :integer
  end

  def down
    remove_column :categories, :app_id
  end
end
