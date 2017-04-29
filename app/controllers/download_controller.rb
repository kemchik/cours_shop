class DownloadController < ApplicationController
  before_action :load_category

  def index
    @products = @category.products
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls #{ send_data @products.to_csv(col_sep: "\t") }
    end
  end

  def load_category
    @category = Category.find(params[:category_id])
  end
  end

