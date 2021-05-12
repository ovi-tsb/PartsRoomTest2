class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update, :destroy, :new_qty, :do_use, :use]
  before_action :authenticate_user!
  before_action :set_product, only: %i[ show edit update destroy use do_use add add_product]
  
  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    @products = Product.order(created_at: :desc).search(params[:search])
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        # logo = Rails.root + current_user.logo.url(:thumb).sub!(/\?.+\Z/, '')
        # # logo at: [0,900], height: 161, width: 250
        # pdf = InvoicePdf.new(@invoice, view_context)
        pdf = Prawn::Document.new
        pdf.text"Hello Ovi"
        send_data pdf.render, filenamme: "product_#{@product.name}.pdf",
                              # filename: "invoice_#{sprintf("%05d", @invoice.invoice_number)}.pdf",
                              type: "application/pdf",
                              disposition: "inline"

      end
    end

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
    labels = Prawn::Labels.render(selected_products, :type => "Avery5160") do |pdf, selected_product|
      pdf.text selected_product.name
    end

    send_data labels, :filename => "labels.pdf"
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
      params.require(:product).permit(:id, :name, :url, :qty, :image, :description, :supplier_number)
    end

    
end
