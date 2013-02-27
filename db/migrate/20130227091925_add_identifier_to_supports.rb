class AddIdentifierToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :identifier, :string
  end
end
