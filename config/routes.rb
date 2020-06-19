Rails.application.routes.draw do
  resources :events do
    resources :event_attendings, only: [:create, :destroy]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "events#index"
end
