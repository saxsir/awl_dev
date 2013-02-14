class Reward < ActiveRecord::Base
  attr_accessible :description, :project_id, :title, :image_url, :amount
  belongs_to :project
end
