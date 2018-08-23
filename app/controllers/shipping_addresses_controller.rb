class ShippingAddressesController < ApplicationController
  
  def edit
  	if set_shipping_address.nil?
  	  @shipping_address = ShippingAddress.create!(profile: current_user.profile)
  	else
  		@shipping_address = set_shipping_address
  	end
  end

  def update
  	@shipping_address = set_shipping_address
  	@shipping_address.update(shipping_address_params)
  	redirect_back fallback_location: orders_path	
  end

  private

  def shipping_address_params
  	params.require(:shipping_address).permit(:number, :street, :suburb, :city, :state, :special)
  end

  def set_shipping_address
    ShippingAddress.find_by(profile: current_user.profile.id)
  end
end
