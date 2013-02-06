class AddImageUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :image_url, :text
  end
end
