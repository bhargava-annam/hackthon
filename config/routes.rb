Rails.application.routes.draw do
  # get 'errors/not_found'

  # get 'errors/internal_server_error'

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


 # FOR ERROR page
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
