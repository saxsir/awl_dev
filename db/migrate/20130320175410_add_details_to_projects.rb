class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :twitter, :text
    add_column :projects, :facebook, :text
    add_column :projects, :web_site, :text
  end
end
