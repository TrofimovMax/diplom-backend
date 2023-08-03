Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  get '/current_user', to: 'current_user#index'
  get '/current_bookings', to: 'bookings#current_bookings'
  get '/admin', to: 'current_user#admin'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :gyms, only: %i[index show create update destroy] do
    resources :bookings, only: %i[index create update destroy]
    resources :wishes, only: %i[index create update destroy]
  end
  # resources :bookings, only: %i[index create update destroy]

  root "articles#index"
end