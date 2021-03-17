class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :update]
  
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
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @product.user_id == current_user.id
     @product.destroy
    end
    redirect_to root_path
  end

    private
    def product_params
      params.require(:product).permit(:name, :price, :description, :category_id, :condition_id, :shipping_charged_id, :prefecture_id, :shipping_days_id, :image).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def ensure_current_user
      if @product.user_id != current_user.id
        redirect_to action: :index
      end
    end
end
