class AddPaymentTagToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :payment_tag, :text
  end
end
