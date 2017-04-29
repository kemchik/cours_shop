class ProductsController < ApplicationController
  before_action :load_category

  def index
    @products = @category.products
    @category_id
    if params[:sort].present?
      @products = @category.products.order(price: :desc)
    end
    if params[:sort_d].present?
      @products = @category.products.order(price: :asc)
    end
  end

  def show
    @product = @category.products.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = @category.products.build(product_params)
    if @product.save
      redirect_to category_products_path(@category)
    else
      render :new
    end
  end

  def edit
    @product = @category.products.find(params[:id])
  end

  def update
    @product = @category.products.find(params[:id])
    if @product.update(product_params)
      redirect_to category_products_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to category_products_path(@category)
  end

  def import
    Product.import(params[:file], @category_id)
    redirect_to root_path, notice: 'Products imported.'
  end

  private

  def load_category
    @category = Category.find(params[:category_id])
    @category_id = @category.id
  end

  def product_params
    params.require(:product)
        .permit(:name, :description, :ingredients, :description, :calories, :image,:weight, :price, :amount)
  end
end
