Rails.application.routes.draw do
  resources :favorites, only: [:index, :create, :destroy, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :show, :edit ,:create, :update]
  resources :pictures, only: [:new, :index, :show, :edit, :update, :create, :destroy] do
    collection do
      patch :confirm
      post :confirm
    end
    member do
      patch :confirm
    end
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
