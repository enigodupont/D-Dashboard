Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get 'dashboard/dashboard'
  delete 'sessions/destroy'

  root 'dashboard#index'
  get 'users/register'
  get 'users/create'
  post 'users/create'

  get 'dice_roller', to: 'dice_roller#index'
  
end
