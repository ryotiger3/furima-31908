class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: "DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
    render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

    private
    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id, :condition_id, :shipping_charged_id, :prefecture_id, :shipping_days_id, :image).merge(user_id: current_user.id)
    end
end
