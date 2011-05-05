MaraTravel::Application.routes.draw do
  resources :trips do
    resources :day_schedules
  end

  root :to => "trips#index"
end

