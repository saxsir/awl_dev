class AddImageToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :Image, :binary
  end
end
