class CustomersController < ApplicationController

  def new
    @order_last = current_user.orders.last
    if @order_last.nil?
      @customer = Customer.new
    else
      @customer = @order_last.customer
    end
  end

  def create
    if user_signed_in?
      @customer = Customer.new(customer_params)
      if @customer.save
        @orders = current_user.orders
        @orders.update_all(customer: @customer)
        redirect_to root_path
      else
        render :new
      end
    else
      session[:customers] ||= []
      session[:customers] << { adress: customer_params[adress], phone: customer_params[:phone], email: customer_params[email]}
      redirect_to root_path
    end
  end

  def customer_params
    params.require(:customer).permit(:adress, :phone, :email)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
