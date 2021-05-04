class ApplicationController < ActionController::Base

	def remove_part
	  @product.qty = @product.qty - 1
	end


end
