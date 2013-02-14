class Reward < ActiveRecord::Base
  attr_accessible :description, :project_id, :title, :image_url
  belongs_to :project
end
