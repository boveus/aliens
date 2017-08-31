Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  #change this to a get to and manually write it in.
  get 'dashboard/shapes', :to => 'main#shapes', :as => 'shapes'
  get 'dashboard/cities', :to => 'main#cities', :as => 'cities'
  get 'dashboard/years', :to => 'main#years', :as => 'years'
  get 'dashboard/states', :to => 'main#states', :as => 'states'
  get 'dashboard/countries', :to => 'main#countries', :as => 'countries'

  scope controller: :main do
    get :dashboard
    get :map
  end
  resources :alien_sightings, only: [:index, :show]
end
