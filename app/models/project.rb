class Project < ActiveRecord::Base
  attr_accessible :support_id,:twitter,:start_day, :facebook, :web_site,:image, :description, :target_amount, :title, :total_amount, :url, :user_id, :payment_tag, :image_url, :headline, :slideshow, :deadline, :state, :category
  belongs_to :user
  has_many :rewards
  has_many :supports
  has_attached_file :image ,:styles => { :thumb => "400x300>" , :show => "800x300>", :slideshow => "1350x654>", :mypage => "160x160>"}

  validates:target_amount, :numericality => {:greater_than_or_equal_to => 1000}
  validates_uniqueness_of :title
  validates_presence_of :target_amount,:headline,:description,:deadline, :start_day, :image, :title

end
