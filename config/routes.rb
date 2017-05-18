Rails.application.routes.draw do
  require "sidekiq/web"

  devise_for :users
  root "home_pages#index"
  namespace :admin do
    mount Sidekiq::Web => "/sidekiq"
    root "static_pages#index"
    resources :courses
    resources :subjects
    resources :users
  end
end
