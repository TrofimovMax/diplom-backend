Rails.application.routes.draw do

  devise_for :users,
             path: '',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           registration: 'signup' }

  resources :gyms, only: %i[index show create update destroy]
  # resources :booking_requests, only: %i[index create update destroy]

  root "articles#index"

end
