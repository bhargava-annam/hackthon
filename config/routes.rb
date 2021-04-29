Rails.application.routes.draw do
  devise_for :users
  resources :hacks do
    member do
      put :like, to:'hacks#upvote'
      put :follow, to:'hacks#follow'
    end
  end
  
  get 'home/index'
  get 'home/about'
  root 'hacks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
