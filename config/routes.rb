Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'courses#index'

namespace :admin do
  resources :courses do
    resources :tasks
  end
end

resources :courses do
  resources :tasks do
    member do
      post :finish
      post :unfinish
    end
  end
end

end
