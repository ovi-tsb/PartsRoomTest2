class Product < ApplicationRecord

	belongs_to :plant

	after_create :generate_code
	mount_uploader :image, ImageUploader

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
