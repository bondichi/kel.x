class ProductsController < ApplicationController

  def index
  	price_question = 
  	max_price = 
  	min_price =
    @products = Product.all.select do | product |
    	product.sale_price_cents
    end
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product: @product)
  end
end
