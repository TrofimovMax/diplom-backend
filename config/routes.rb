Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :gyms, only: %i[index show create update destroy]
  # resources :booking_requests, only: %i[index create update destroy]

  get '/show' => 'articles#show'

  root "articles#index"

end
