Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  #change this to a get to and manually write it in.
  scope controller: :main do
    get :dashboard
    get :map
  end
  resources :alien_sightings, only: [:index, :show]
end
