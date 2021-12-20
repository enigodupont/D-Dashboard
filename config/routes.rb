Rails.application.routes.draw do
  root 'dashboard#index'

  get 'aboutus', to: 'dashboard#aboutus'

  get 'healthz', to: 'dashboard#healthz'

  get 'users/login'
  get 'users/create_login', to: 'users#login'
  post 'users/create_login'
  get 'users/destroy_login'
  get 'users/register'
  get 'users/create'
  post 'users/create'

  get 'dice_roller', to: 'utility#dice_roller'
  get 'level_calculator', to: 'utility#level_calculator'

  get 'random_generator', to: 'random_generator#index'

  get 'inventory/bag_of_holding'

  get 'inventory/create_bag_of_holding'
  post 'inventory/create_bag_of_holding'

  get 'inventory/new_bag_of_holding'
  post 'inventory/new_bag_of_holding'

  get 'inventory/show_bags_of_holding'
  post 'inventory/show_bags_of_holding'
  
  get 'inventory/delete_bag_of_holding'

  get 'inventory/show_inventory'

  get 'inventory/delete_item'

  get 'inventory/new_item'
  post 'inventory/create_item'
end
