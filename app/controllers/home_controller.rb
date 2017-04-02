class HomeController < ApplicationController
  def index
    @category = Category.all
    @product_1 = Product.find(9)
  end

  def register
  end
end
