WineTracker::Application.routes.draw do


  get "/", to: "calendars#index", as: :root
  get "/calendar", to: "calendars#show", as: :calendar

  resources :users do
    resources :days, only: [:create, :show, :edit, :update]
  end

  post "/login", to: "sessions#create", as: :login
  post "/logout", to: "sessions#destroy", as: :logout

  resources :sessions, only: [:create]

end
