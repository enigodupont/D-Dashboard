Rails.application.routes.draw do
  root 'dashboard#index'
  get 'aboutus', to: 'dashboard#aboutus'

  get 'users/register'
  get 'users/create'
  post 'users/create'

  get 'dice_roller', to: 'dice_roller#index'

  get 'random_generator', to: 'random_generator#index'
  
end
