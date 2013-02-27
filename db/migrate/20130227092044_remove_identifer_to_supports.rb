class RemoveIdentiferToSupports < ActiveRecord::Migration
  def up
    remove_column :supports, :identifer
  end

  def down
    add_column :supports, :identifer, :string
  end
end
