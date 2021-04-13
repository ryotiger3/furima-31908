class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]
  before_action :ensure_current_user

  def index
    if current_user.id != @product.user_id || @product.purchase_history == nil
      @order = Order.new
    else
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_product
      @order.save
      redirect_to root_path
    else
      render template: "orders/index"
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(token: params[:token], product_id: params[:product_id], user_id: current_user.id)
  end

  def ensure_current_user
    if @product.user_id == current_user.id
      redirect_to root_path
    end
  end

  def pay_product 
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end