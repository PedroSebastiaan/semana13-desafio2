Rails.application.routes.draw do
  resources :pets do
    resources :pet_histories
    delete 'pet_histories/:id', to: 'pet_histories#destroy', as: 'pet_histories_destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pets#index"
end
