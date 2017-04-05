class AdminProductsController < ApplicationController


  def show
    @@customer = Customer.find(params[:id])
    @order = Order.where(customer_id: @@customer.id)
  end

  def updates
    @orders = Order.where(customer_id: @@customer.id)
    if @orders.update(status: 'sent')
      redirect_to admin_product_path(@@customer.id)
    else

    end
  end

end
