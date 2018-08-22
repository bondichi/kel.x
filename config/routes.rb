Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "pages#home"
  resources :surveys, only: [:show] do
  	resources :survey_responses, only: [:new, :create]
  end

  resources :questions, only:[:show] do
  	resources :answers, only:[:new, :create]
  end

  resource :profile, only: [:update, :edit, :show]
  resources :products, only: [:index, :show]
end
