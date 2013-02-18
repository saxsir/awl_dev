class Support < ActiveRecord::Base
  attr_accessible :amount, :project_id, :reward_id, :user_id, :comment, :success
  belongs_to :project
  belongs_to :user
end
