TransitAlarm::Application.routes.draw do

  root 'routes#index'

  get 'routes/list', :to => "routes#list"

  resources :routes
  resources :stops

end
