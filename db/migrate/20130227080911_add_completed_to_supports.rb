class AddCompletedToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :completed, :boolean
  end
end
