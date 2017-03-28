Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root controller: "submissions", action: "index"

  resources :submissions, except: [:show, :edit, :update, :destroy]
  resources :comments, except: [:show, :edit, :update, :destroy]
  resources :users, only: [:new, :create]

  get "comments/:submission_id", controller: "comments", action: "index"
end
