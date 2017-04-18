class CommentsController < ApplicationController
  before_action :load_product

  def index
    @product = Product.find(params[:product_id])
    @one = Comment.all.where(product_id: @product)
    @comments = Comment.new
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @product.comments.build(comment_params)
    if @comment.save
      redirect_to product_comments_path(@product.id)
    else
      render :new
    end
  end

  def destroy

  end

  def load_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment)
        .permit(:name, :comment)
  end
end
