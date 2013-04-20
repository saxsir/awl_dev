class Reward < ActiveRecord::Base
  attr_accessible :description, :project_id, :title, :image_url, :amount, :quantity_limit
  belongs_to :project
  has_many :supports
end
