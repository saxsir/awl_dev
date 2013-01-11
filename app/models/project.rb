class Project < ActiveRecord::Base
  attr_accessible :target_amount, :title, :total_amount, :url, :user_id, :payment_tag
  belongs_to :user
end
