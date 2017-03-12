class OrdersController < ApplicationController
  before_action :load_product, only: [:new, :create]

    def index
      @order = Order.where(user_id: current_user)
    end

    def new
      @order = Order.new
    end

    def create
      @order = Order.new
      @order.attributes = order_params
      @order.product = @product
      @order.user = current_user


      if @order.save
        redirect_to root_path
      else
        render :new
      end

    end

    def destroy
      @order = @order.find(params[:id])
      @order.destroy
      redirect_to order_path(@user)
    end

    private

    def order_params
      params.require(:order).permit(:amount)
    end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
