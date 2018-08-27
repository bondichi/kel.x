class ProductsController < ApplicationController

# look through all the questions to find ones with rules

  def index
  	survey_response = SurveyResponse.find_by(profile_id: current_user.id)
  	
  	answers_for_filter = Answer.where(survey_response_id: survey_response.id).select { |answer| answer.content.class == Hash }

  	# @products = Product.all
  	@filtered_products = filter_products_all(Product.all, answers_for_filter)
  	# raise
  	# price_question = Answer.where(survey_response_id: survey_response.id).find_by(question_id: 17)
  	# max_price = price_question.content["rules"]["sale_price_cents"]["lesser"] 
  	# min_price = price_question.content["rules"]["sale_price_cents"]["greater"] 
   #  @products = Product.all.select do | product |
   #  	product.sale_price_cents > min_price && product.sale_price_cents < max_price
   #  end
    
   #  colour_question = Answer.where(survey_response_id: survey_response.id).find_by(question_id: 16)
   #  excludes = colour_question.content["rules"]["main_colour"]["excludes"]
   #  @products = Product.all.reject do | product |
   #  	# raise
   #  	excludes.any? { |colour| colour.capitalize == product.main_colour }
   #  end	
   #  # raise
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
    	excludes.any? { |colour| colour.capitalize == product.main_colour }
    end
  end

  def filter_products_by_price(products, answer)
	 	max_price = answer.content["rules"]["sale_price_cents"]["lesser"] 
  	min_price = answer.content["rules"]["sale_price_cents"]["greater"] 

    products.select { | product | product.sale_price_cents > min_price && product.sale_price_cents < max_price }
  end
end
