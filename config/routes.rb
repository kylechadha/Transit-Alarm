TransitAlarm::Application.routes.draw do

  root 'routes#index'

  get 'routes/list', :to => "routes#list"

  resources :routes, only: [:index, :show]
  resources :stops, only: [:index]
  resources :journeys, only: [:new, :create, :show]

end
