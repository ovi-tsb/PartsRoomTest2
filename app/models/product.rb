class Product < ApplicationRecord
	


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

	def self.search_1(search_1)
	  if search_1
	    # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	    where(" QrCode.call(product_url(product)) LIKE ?", "%#{search_1}%")
	  else
	    find(:all)
	  end
	end



end
