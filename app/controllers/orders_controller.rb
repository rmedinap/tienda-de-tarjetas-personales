class OrdersController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    if @cart.items.empty?
      redirect_to root_path, notice: "Elija al menos un producto."
    else
      @order = Order.new
    end
  end

  def edit
  end

  def create
    @order = current_user.orders.build(order_params)

    @order.add_line_items_from_cart @cart

    # if @order.subtotal > 0
    if @order.save
      cookies[:cart_items] = nil
      redirect_to thanks_order_path(@order), notice: '¡Orden creada satisfactoriamente!'
    else
      render action: 'new'
    end
    # end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id, :name, :email, :address, :document_number,
                                    :payment_type, :special_id, :subtotal, :discount,
                                    :terms_of_service)
    end
end
