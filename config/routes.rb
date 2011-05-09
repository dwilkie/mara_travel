MaraTravel::Application.routes.draw do
  devise_for :users

  resources :trips do
    resources :day_schedules
  end

  resources :days do
    resources :activity_schedules
  end

  root :to => "trips#index"
end

