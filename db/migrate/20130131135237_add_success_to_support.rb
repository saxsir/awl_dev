class AddSuccessToSupport < ActiveRecord::Migration
  def change
    add_column :supports, :success, :boolean
  end
end
