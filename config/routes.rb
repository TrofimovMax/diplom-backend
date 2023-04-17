Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  get '/current_bookings', to: 'bookings#current_bookings'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :gyms, only: %i[index show create update destroy]
  resources :bookings, only: %i[index create update destroy]

  root "articles#index"

end