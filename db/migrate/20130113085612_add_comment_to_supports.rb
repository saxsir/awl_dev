class AddCommentToSupports < ActiveRecord::Migration
  def change
    add_column :supports, :comment, :string
  end
end
