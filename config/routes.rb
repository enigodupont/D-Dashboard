Rails.application.routes.draw do
  root 'dashboard#index'
  get 'users/register'
  get 'users/create'
  post 'users/create'

  
end
