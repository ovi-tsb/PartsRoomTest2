class Product < ApplicationRecord

	belongs_to :plant

	has_one_attached :featured_image, dependent: :destroy

	def featured_image_url
	  if self.featured_image.attachment
	    self.featured_image.attachment.service_url
	  end
	end

	after_create :generate_code
	# mount_uploader :image, ImageUploader

	enum status: { active: 0, obsolete: 1}

	def generate_code
	  self.url = SecureRandom.hex
	  # self.url = product_path
	  save
	end


	def self.search(search)
	  if search
	    
	    # where('description ILIKE ? OR id::text LIKE ?', "%#{search}%", "%#{search}%")
	    where('description ILIKE ? OR item_no ILIKE? OR supplier_number ILIKE ? OR location ILIKE ? OR supplier_name ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")

	  else
	    # find(:all)
	    Product.all
	  end
	end



end
