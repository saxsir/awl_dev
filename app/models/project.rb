class Project < ActiveRecord::Base
  attr_accessible :support_id, :image, :description, :target_amount, :title, :total_amount, :url, :user_id, :payment_tag, :image_url, :headline, :slideshow, :deadline, :state, :category
  belongs_to :user
  has_many :rewards
  has_many :supports
  has_attached_file :image

  validates:target_amount, :numericality => {:greater_than_or_equal_to => 1000}

  validate on: create do
  	IMAGE_TYPES = { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }
		if image != nil
      if image.size > 64.megabytes
        errors.add(:image, "filesize is required under 64 MB.")
      end
      unless IMAGE_TYPES.has_key?(content_type)
        errors.add(:image, "filetype is required jpg|png|gif.")
      end
		end
	end

	def extension
	  IMAGE_TYPES[content_type]
	end


  def image= (i)
    if i
      self.picture_data = i.read
      self.content_type = i.content_type
    end
  end
end
