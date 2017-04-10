class AdminController < ApplicationController

  def index
    @customer = Customer.order(created_at: :desc)
  end

end
