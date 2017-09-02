Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  #change this to a get to and manually write it in.
  get 'dashboard/shapes', :to => 'main#shapes', :as => 'shapes'
  get 'dashboard/cities', :to => 'main#cities', :as => 'cities'
  get 'dashboard/years', :to => 'main#years', :as => 'years'
  get 'dashboard/states', :to => 'main#states', :as => 'states'
  get 'dashboard/shapebystate', :to => 'main#shape_by_state', :as => 'shape_by_state'
  get 'dashboard/countries', :to => 'main#countries', :as => 'countries'
  get 'dashboard/percapitabystate', :to => 'main#per_capita_by_state', :as => 'per_capita_by_state'
  get '/dashboard', :to => 'main#dashboard', :as => 'dashboard'
  get '/total_sightings_map', :to => 'main#total_sightings_map', :as => 'total_sightings_map'
get '/per_capita_map', :to => 'main#per_capita_map', :as => 'per_capita_map'
  get '/comments', :to => 'main#comments', :as => 'comments'
  resources :alien_sightings, only: [:index, :show]
end
