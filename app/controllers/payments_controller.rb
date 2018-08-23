class PaymentsController < ApplicationController
	before_action :set_order

  def new
    @cart_items = current_user.cart_items
    @shipping = ShippingAddress.find(current_user.profile.shipping_address_ids.first)
  end

  def create
    customer = Stripe::Customer.create(
       source: params[:stripeToken],
       email:  params[:stripeEmail]
     )

     charge = Stripe::Charge.create(
       customer:     customer.id,   # You should store this customer id and re-use it.
       amount:       @order.amount_cents,
       description:  "Payment for #{@order.user}'s products for order #{@order.id}",
       currency:     @order.amount.currency
     )

    @order.update(payment: charge.to_json, state: 'paid')
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to order_path(@order)
  end

	private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
