class AddStartDayToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :start_day, :date
  end
end
