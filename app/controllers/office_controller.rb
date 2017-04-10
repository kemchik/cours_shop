class OfficeController < ApplicationController
  def index
    @order =  Order.where(user_id: current_user, status: ['processing', 'sent'])
  end
end
