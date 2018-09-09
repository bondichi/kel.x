class ProductsController < ApplicationController
  def index
  	survey_response = SurveyResponse.find_by(profile_id: current_user.id)
    answers_for_tops_filter = []
    answers_for_bottoms_filter = []
  	Answer.where(survey_response_id: survey_response.id).each do |answer| 
      if answer.content['name'] == 'budget_tops' || answer.content['name'] == 'style_5'
        answers_for_tops_filter << answer
      end
    end
    Answer.where(survey_response_id: survey_response.id).each do |answer| 
      if answer.content['name'] == 'budget_bottoms' || answer.content['name'] == 'style_5'
        answers_for_bottoms_filter << answer
      end      
    end
    products_tops = Product.where(category: "TOPS")
    products_bottom = Product.where(category: "BOTTOMS")

  	@filtered_products_tops = filter_products_all(products_tops, answers_for_tops_filter)
    @filtered_products_bottoms = filter_products_all(products_bottom, answers_for_bottoms_filter)
    # @filtered_products_bottoms = filter_products_all(Product.where(category: "BOTTOMS"), answers_for_filter)
    # @filtered_products_tops = Product.where(category: "TOPS")
    # @filtered_products_bottoms = Product.where(category: "BOTTOMS")
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product: @product)
  end

  def filter_products_all(products, answers)
  	answers.each do | answer |
  		products = filter_products(products, answer)
  	end
  	products
  end

  def filter_products(products, answer)
 		if answer.content['rules']['sale_price_cents']
  	  products = filter_products_by_price(products, answer)
  	end

  	if answer.content['rules']['main_colour']
  		products = filter_products_by_colour(products, answer)
  	end

  	products
  end

  def filter_products_by_colour(products, answer)
  	excludes = answer.content["rules"]["main_colour"]["excludes"]
    
    products.reject do | product |
    	excludes.any? { |colour| colour == product.main_colour }
    end
  end

  def filter_products_by_price(products, answer)
    
	 	max_price = answer.content["rules"]["sale_price_cents"]["lesser"] 
  	min_price = answer.content["rules"]["sale_price_cents"]["greater"] 

    products.select { | product | product.sale_price_cents > min_price && product.sale_price_cents < max_price }
  end
end
