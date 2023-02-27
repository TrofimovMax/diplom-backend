Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  get '/show' => 'articles#show'

  root "articles#index"

end
