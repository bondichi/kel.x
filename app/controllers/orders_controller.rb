class OrdersController < ApplicationController

  def create
    @cart_items = current_user.cart_items

    sum = @cart_items.map { |item| item.quantity * item.product.sale_price }.sum

    order = Order.create!(user: current_user, amount: sum, state: "pending")

    @cart_items.each do |cart_item|
      product = Product.find(cart_item.product_id)

      OrderItem.create!(product: cart_item.product, quantity: cart_item.quantity, product_price: product.sale_price, order: order)
    end
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end
end


