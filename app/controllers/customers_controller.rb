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
        redirect_to root_path
      else
        render :new
      end
      session[:customers] ||= []
      session[:customers] << { adress: customer_params[adress], phone: customer_params[:phone], email: customer_params[email]}
    end
  end

  def customer_params
    params.require(:customer).permit(:address, :phone, :email)
  end
end
