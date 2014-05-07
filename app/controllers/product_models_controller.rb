class ProductModelsController < ApplicationController
  before_action :set_product_model, only: [:show, :edit, :update, :destroy]

  # GET /product_models
  # GET /product_models.json
  def index
    @product_models = ProductModel.all
  end

  # GET /product_models/1
  # GET /product_models/1.json
  def show
  end

  # GET /product_models/new
  def new
    @product_model = ProductModel.new
  end

  # GET /product_models/1/edit
  def edit
  end

  # POST /product_models
  # POST /product_models.json
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

  # PATCH/PUT /product_models/1
  # PATCH/PUT /product_models/1.json
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

  # DELETE /product_models/1
  # DELETE /product_models/1.json
  def destroy
    @product_model.destroy
    respond_to do |format|
      format.html { redirect_to product_models_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_model
      @product_model = ProductModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_model_params
      params.require(:product_model).permit(:name, :active)
    end
end
