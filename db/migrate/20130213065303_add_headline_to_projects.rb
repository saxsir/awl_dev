class AddHeadlineToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :headline, :text
  end
end
