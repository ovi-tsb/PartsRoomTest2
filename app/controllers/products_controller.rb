class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy, :new_qty, :do_use, :use]
  before_action :authenticate_user!
  before_action :set_product, only: %i[ show edit update destroy use do_use add add_product]
  
  # GET /products
  # GET /products.json
  helper_method :sort_column, :sort_direction
  def index
    # @products = Product.all
    if current_user.try(:type) == 'SuperUser'
      @products = Product.order(sort_column + " " + sort_direction).search(params[:search]).paginate(page: params[:page], per_page: 30)
    elsif 
      @products = Product.where(plant_id: current_user.plant_id).order(sort_column + " " + sort_direction).search(params[:search]).paginate(page: params[:page], per_page: 30)
    # @products = Product.order(params[:sort])
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # respond_to do |format|
      # format.html
      # format.pdf do
        # logo = Rails.root + current_user.logo.url(:thumb).sub!(/\?.+\Z/, '')
        # # logo at: [0,900], height: 161, width: 250
        # pdf = InvoicePdf.new(@invoice, view_context)
        # pdf = Prawn::Document.new
        # pdf.text"Hello Ovi"
        # send_data pdf.render, filenamme: "product_#{@product.name}.pdf",
                              # filename: "invoice_#{sprintf("%05d", @invoice.invoice_number)}.pdf",
                              # type: "application/pdf",
                              # disposition: "inline"

      # end
    # end

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  
  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def use
 end

 def do_use
    if @product.qty >= params[:qty].to_i
      @product.update qty: @product.qty - params[:qty].to_i
     redirect_to @product, notice: "Product was successfully updated."
    else
      @product.errors.add(:qty, "more than available quantity")
     render :use
    end
 end

# <<<<<<< Updated upstream
  def print_labels
    selected_products = Product.where id: params[:products_ids]
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
        pdf.draw_text selected_product.description.upcase.truncate(32),:style => :bold, :at => [5,50], :size => 10, overflow: :truncate
      end
      pdf.svg QrCode.call(product_url(selected_product)), :at => [5,45], :width => 45, :height => 45, :align => :left # [5 is x and 70 is y]
      pdf.draw_text "Item.#: " + selected_product.item_no.upcase.truncate(20), :at => [60,30], :size => 9
      if selected_product.location
        pdf.draw_text "Location: " + selected_product.location.upcase.truncate(12), :at => [60,15], :size => 9
      end
      if selected_product.supplier_number
        pdf.draw_text "Supp.#: " + selected_product.supplier_number.upcase.truncate(20), :at => [60,2], :size => 9
      end
    end
############### Small QR #########################


    send_data labels, :filename => "labels.pdf", :type => "application/pdf"
  end
# =======
 def add
 end

 def add_product
  if @product.qty >= params[:qty].to_i
    @product.update qty: @product.qty + params[:qty_add].to_i
    redirect_to @product, notice: "Product was successfully updated."
  else
    @product.errors.add(:qty, "more than available quantity")
    render :add
  end
 end

# >>>>>>> Stashed changes

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:id, :name, :url, :qty, :image, :description, :supplier_number, 
                                      :item_no, :location, :supplier_name, :status, :plant_id, :featured_image)
    end

    def sort_column
      params[:sort] || "id"
    end

    def sort_direction
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
      params[:direction] || "asc"
    end

    
end
