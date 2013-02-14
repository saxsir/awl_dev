class AddImageUrlToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :image_url, :text
  end
end
