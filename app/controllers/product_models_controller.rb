class ProductModelsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product_model, only: [:show, :edit, :update, :destroy]

  def index
    @product_models = ProductModel.all
  end

  def show
    @products = @product_model.products
  end

  def new
    @product_model = ProductModel.new
  end

  def edit
  end

  def create
    @product_model = ProductModel.new(product_model_params)

    respond_to do |format|
      if @product_model.save
        format.html { redirect_to @product_model, notice: 'Product model was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_model }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_model.update(product_model_params)
        format.html { redirect_to @product_model, notice: 'Product model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_model.destroy
    respond_to do |format|
      format.html { redirect_to product_models_url }
      format.json { head :no_content }
    end
  end

  private
    def set_product_model
      @product_model = ProductModel.find(params[:id])
    end

    def product_model_params
      params.require(:product_model).permit(:name, :active)
    end
end
