class ChangeColumnDeadlineToProjects < ActiveRecord::Migration
  def up
    change_column(:projects,:deadline,:interger)
 
  end

  def down
  end
end
