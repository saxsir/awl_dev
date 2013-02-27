class AddPayerIdToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :payer_id, :string
  end
end
