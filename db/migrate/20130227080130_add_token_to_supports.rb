class AddTokenToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :token, :string
  end
end
