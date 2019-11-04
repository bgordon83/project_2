# frozen_string_literal: true

Rails.application.routes.draw do
  resources :workout_logs
  # RESTful routes
  resources :examples, except: %i[ edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
