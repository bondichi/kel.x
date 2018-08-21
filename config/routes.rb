Rails.application.routes.draw do
  get 'survey_responses/create'
  get 'survey_responses/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surveys, only: [:show] do
  	resources :survey_responses, only: [:new, :create]
  end

  resources :questions, only:[:show] do
  	resources :answers, only:[:new, :create]
  end
end
