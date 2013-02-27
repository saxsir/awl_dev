class AddIdentiferToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :identifer, :string
  end
end
