Rails.application.routes.draw do
  get 'answers/create'
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "pages#home"
  resources :surveys, only: [:show] do
  	resources :survey_responses, only: [:new, :edit]
  end

  resources :questions, only:[:show] do
  	resources :answers, only:[:new, :create]
  end

  resource :profile, only: [:update, :edit, :show] do
    resource :shipping_address, only: [:update, :edit]
  end

  resources :products, only: [:index, :show]

  resources :cart_items

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end
