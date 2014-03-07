TransitAlarm::Application.routes.draw do

  resources :routes, only: [:index, :show]
  resources :stops, only: [:index, :show]

end
