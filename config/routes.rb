WineTracker::Application.routes.draw do


  get "/", to: "calendars#index", as: :root
  get "/calendar", to: "calendars#show", as: :calendar

  resources :users, only: [:new, :edit, :update, :destroy, :show] do
    resources :days, only: [:show, :edit, :update]
  end

end
