class ProductUsersController < ApplicationController
  before_action :set_product_user, only: [:show, :edit, :update, :destroy]
  before_action :set_product

  def index
    @product_users = ProductUser.all
  end

  def show
  end

  def new
    @product_user = ProductUser.new
  end

  def edit
  end

  def create
    @product_user = ProductUser.new(product_user_params)

    respond_to do |format|
      if @product_user.save
        format.html { redirect_to product_product_user_url(@product, @product_user), notice: 'Product user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_user.update(product_user_params)
        format.html { redirect_to product_product_user_url(@product, @product_user), notice: 'Product user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_user.destroy
    respond_to do |format|
      format.html { redirect_to product_product_users_url(@product) }
      format.json { head :no_content }
    end
  end

  private
    def set_product_user
      @product_user = ProductUser.find(params[:id])
    end

    def product_user_params
      params.require(:product_user).permit(:product_id, :company_name, :company_message, :user_name, :job_title, :address, :phone, :email, :website)
    end

    def set_product
      begin
        @product = Product.find params[:product_id]
      rescue
        @product = Product.last
        flash[:notice] = "No se encontró el producto que buscaba, pruebe con este modelo =)."
      end
    end
end
