class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:destroy, :new]
  # before_action :set_user

  def index
    @cart_items = current_user.cart_items
    @cart_items_tops = @cart_items.select {|cart_item| cart_item.product.category == "TOPS"}
    @cart_items_bottoms = @cart_items.select {|cart_item| cart_item.product.category == "BOTTOMS"}
    @sub_total_tops = @cart_items_tops.map { |item| item.quantity * item.product.sale_price }.sum
    @sub_total_bottoms = @cart_items_bottoms.map { |item| item.quantity * item.product.sale_price }.sum
    @sum_total = @cart_items.map { |item| item.quantity * item.product.sale_price }.sum
  end

  def show
  end

  def new
  end

  def create
    if @cart_item = CartItem.find_by(user: current_user, product_id: cart_item_params[:product_id])
      # already exist, update the item and increate the quantity
      @cart_item.quantity += 1
    else
      # create new cart item
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.quantity = 1
      @cart_item.user = current_user
    end

    if @cart_item.save!
      redirect_back fallback_location: '/'
    else
      # needs to be fixed up - better error message.
      return "please try again"
    end
  end

  def edit
  end

  # def update
  #   if @cart_item.update(cart_item_params)
  #     @cart_item.user = current_user
  #     # authorize @cart_item
  #     # redirect_to cart_item_path(@cart_item)
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  # def set_user
  #   @cart_item.user = current_user
  # end
end
