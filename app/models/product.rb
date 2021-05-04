class Product < ApplicationRecord
	after_create :generate_code
	mount_uploader :image, ImageUploader

	def generate_code
	  self.url = SecureRandom.hex
	  # self.url = product_path
	  save
	end


	def self.search(search)
	  if search
	    # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    # where( "name LIKE ?", "%#{search}%")
	    # where("id::text LIKE ?", "%#{search}%")
	    # where("name LIKE ?", "%#{search}%")

	    where('name ILIKE ? OR id::text LIKE ?', "%#{search}%", "%#{search}%")

	  else
	    # find(:all)
	    Product.all
	  end
	end



end
