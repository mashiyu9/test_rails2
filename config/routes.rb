Rails.application.routes.draw do
  resources :pictures, only: [:new, :index, :show, :edit, :upgrate, :create, :destroy] do
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
