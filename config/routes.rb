Rails.application.routes.draw do
  resources :todos

  root "todos#index"

  resources :todos do
       member do
         post :check
       end
  end
end
