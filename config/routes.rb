Rails.application.routes.draw do

  devise_for :users
  root "home_pages#index"
  namespace :admin do
    root "static_pages#index"
    resources :courses
    resources :subjects
    resources :users
    resources :course_subjects
  end
end
