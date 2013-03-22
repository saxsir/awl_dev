class AddQuantityLimitToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :quantity_limit, :integer
  end
end
