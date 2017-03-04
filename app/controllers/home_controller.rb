class HomeController < ApplicationController
  def index
    @category = Category.all
  end

  def register
  end
end
