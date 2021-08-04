class GenerateSidePdfJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	@product = Product.find(params[:id])
  	selected_products = Product.where id: params[:products_ids]
  	# selected_products = Product.where("id in (?)", params[:products_ids])
  	 ############### Big QR #########################
  	         # labels = Prawn::Labels.render(selected_products, :type => "Avery5160") do |pdf, selected_product|
  	         #   pdf.svg QrCode.call(product_url(selected_product)), :at => [5,68], :width => 65, :height => 65, :align => :left # [5 is x and 70 is y]
  	         #   pdf.draw_text selected_product.description.upcase.truncate(20),:style => :bold, :at => [75,55], :size => 10, overflow: :truncate
  	         #   pdf.draw_text "Supp.#: " + selected_product.supplier_number, :at => [75,35], :size => 9
  	         #   pdf.draw_text "Location: " + selected_product.supplier_number, :at => [75,15], :size => 9
  	           
  	         # end
  	     ############### Big QR #########################
  	     ############### Small QR #########################
  	         labels = Prawn::Labels.render(selected_products, :type => "Avery5160") do |pdf, selected_product|
  	           if selected_product.description
  	             pdf.draw_text selected_product.description.upcase.truncate(29),:style => :bold, :at => [8,50], :size => 10, overflow: :truncate
  	           end
  	           pdf.svg QrCode.call(product_url(selected_product)), :at => [8,45], :width => 45, :height => 45, :align => :left # [5 is x and 70 is y]
  	           pdf.draw_text "Item #: " + selected_product.item_no.upcase.truncate(20), :at => [60,30], :size => 9
  	           if selected_product.location
  	             pdf.draw_text "Location: " + selected_product.location.upcase.truncate(12), :at => [60,15], :size => 9
  	           end
  	           if selected_product.manufacturer_no
  	             pdf.draw_text "Manuf.#: " + selected_product.manufacturer_no.upcase.truncate(20), :at => [60,2], :size => 9
  	           end
  	         end
  	     ############### Small QR #########################


  	         send_data labels, :filename => "labels.pdf", :type => "application/pdf"
  	# redirect_to products_path
  	    
  	
  end
end
