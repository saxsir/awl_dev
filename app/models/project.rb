class Project < ActiveRecord::Base
  attr_accessible :support_id,:twitter,:start_day, :facebook, :web_site,:image, :description, :target_amount, :title, :total_amount, :url, :user_id, :payment_tag, :image_url, :headline, :slideshow, :deadline, :state, :category
  belongs_to :user
  has_many :rewards
  has_many :supports
  has_attached_file :image

  validates:target_amount, :numericality => {:greater_than_or_equal_to => 1000}
  #validates_uniqueness_of :title
  #validates_presence_of :target_amount,:headline,:description,:deadline

end
