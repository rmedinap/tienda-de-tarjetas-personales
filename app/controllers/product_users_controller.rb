class ProductUsersController < ApplicationController
  before_action :set_product_user, only: [:show, :edit, :update, :destroy]

  # GET /product_users
  # GET /product_users.json
  def index
    @product_users = ProductUser.all
  end

  # GET /product_users/1
  # GET /product_users/1.json
  def show
  end

  # GET /product_users/new
  def new
    @product_user = ProductUser.new
  end

  # GET /product_users/1/edit
  def edit
  end

  # POST /product_users
  # POST /product_users.json
  def create
    @product_user = ProductUser.new(product_user_params)

    respond_to do |format|
      if @product_user.save
        format.html { redirect_to @product_user, notice: 'Product user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_users/1
  # PATCH/PUT /product_users/1.json
  def update
    respond_to do |format|
      if @product_user.update(product_user_params)
        format.html { redirect_to @product_user, notice: 'Product user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_users/1
  # DELETE /product_users/1.json
  def destroy
    @product_user.destroy
    respond_to do |format|
      format.html { redirect_to product_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_user
      @product_user = ProductUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_user_params
      params.require(:product_user).permit(:product_id, :company_name, :company_message, :user_name, :job_title, :address, :phone, :email, :website)
    end
end
