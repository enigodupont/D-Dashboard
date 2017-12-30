Rails.application.routes.draw do
  root 'dashboard#index'
  get 'users/register'
  get 'users/create'
  post 'users/create'

  get 'dice_roller', to: 'dice_roller#index'
  
end
