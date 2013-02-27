class AddCanceledToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :canceled, :boolean
  end
end
