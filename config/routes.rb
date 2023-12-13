Rails.application.routes.draw do
  devise_for :users

  resources :categories, only: [:index, :show, :new, :create] do
    resources :transactions, only: [:index, :new, :create, :show]
  end

  root "categories#index"
end
