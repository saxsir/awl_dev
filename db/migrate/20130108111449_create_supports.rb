class CreateSupports < ActiveRecord::Migration
  def change
    create_table :supports do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :reward_id
      t.integer :amount

      t.timestamps
    end
  end
end
