class Project < ActiveRecord::Base
  attr_accessible :support_id, :target_amount, :title, :total_amount, :url, :user_id, :payment_tag, :image_url, :headline, :slideshow
  belongs_to :user
  has_many :rewards
  has_many :supports
end
