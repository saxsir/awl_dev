class AddAmountToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :amount, :integer
  end
end
