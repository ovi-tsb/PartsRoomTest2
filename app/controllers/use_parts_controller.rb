class UsePartsController < ApplicationController
  before_action :set_use_part, only: [:show, :edit, :update, :destroy]

  def index
    @use_part = UsePart.all
  end

  def edit
  end

  def update
  end

  def show
  end

  def new
    @use_part = UsePart.new
  end


  def create
    @use_part = UsePart.new(use_part_params)

    respond_to do |format|
      if @use_part.save
        format.html { redirect_to @use_part, notice: 'UsePart was successfully created.' }
        format.json { render :show, status: :created, location: @use_part }
      else
        format.html { render :new }
        format.json { render json: @use_part.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_use_part
      @use_part = UsePart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def use_part_params
      params.require(:use_part).permit(:qty)
    end
end
