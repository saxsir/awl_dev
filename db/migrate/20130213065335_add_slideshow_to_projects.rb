class AddSlideshowToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :slideshow, :boolean
  end
end
