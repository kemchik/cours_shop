class CustomersController < ApplicationController

  def new
    if user_signed_in?
      @customer_last = Customer.where(user_id: current_user).last
      if @customer_last.nil?
        @customer = Customer.new
      else
        @customer = @customer_last
      end
    else
      @customer = Customer.new
    end
  end

  def create
    if user_signed_in?
      @customer = Customer.new(customer_params)
      @customer.user = current_user
      if @customer.save
        @orders = Order.all.where(user: current_user, status: nil)
        @orders.update_all(customer_id: @customer.id, status: 'processing')
        redirect_to root_path
      else
        render :new
      end
    else
      @customer = Customer.new(customer_params)
      if @customer.save
        @order = []
        session[:orders].each do |order|
          @order = Order.new(product_id: order['product_id'], amount: order['amount'])
          @order.save
        end
        @orders = Order.all.where(user: nil, status: nil)
        @orders.update_all(customer_id: @customer.id, status: 'processing')
        reset_session
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def customer_params
    params.require(:customer).permit(:address, :phone, :email)
  end
end
