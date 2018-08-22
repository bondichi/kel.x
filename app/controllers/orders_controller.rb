class OrdersController < ApplicationController

  def create
    @cart_items = current_user.cart_items

    sum = @cart_items.map { |item| item.quantity * item.product.sale_price }.sum

    order = Order.create!(user: current_user, amount: sum)

    @cart_items.each do |cart_item|
      product = Product.find(cart_item.product_id)

      OrderItem.create!(product: cart_item.product, quantity: cart_item.quantity, product_price: product.sale_price, order: order)
      # sum += price
    end
    # order.amount_cents = sum
    # order.save!
    redirect_to order_path(order)
  end

  def show
    @order = Order.find(current_user.order)
  end

end


