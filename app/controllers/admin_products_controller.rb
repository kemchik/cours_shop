class AdminProductsController < ApplicationController


  def show
    @customer = Customer.find(params[:id])
    @order = Order.where(customer_id: @customer.id)
  end

  def update
    Order.where(customer_id: params[:id]).update(status: 'sent')
    redirect_to admin_product_path(params[:id])
  end
end

