Rails.application.routes.draw do

  devise_for :users do
    namespace :admin do
      resources :users
    end
  end
  root "static_pages#home"
end
