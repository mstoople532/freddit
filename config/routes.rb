Rails.application.routes.draw do

  root controller: "submissions", action: "index"

  resources :submissions, except: [:show, :edit, :update, :destroy]
  resources :comments, except: [:show, :edit, :update, :destroy]

  get "comments/:submission_id", controller: "comments", action: "index"
end
