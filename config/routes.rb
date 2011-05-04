MaraTravel::Application.routes.draw do
  resources :trips
  root :to => "trips#index"
end

