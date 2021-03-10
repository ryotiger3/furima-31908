class ItemsController < ApplicationController
  def index
    @products = Product.all
  end
end
