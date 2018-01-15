Rails.application.routes.draw do
  root 'dashboard#index'


  get 'aboutus', to: 'dashboard#aboutus'

  get 'users/login'
  get 'users/createLogin', to: 'users#login'
  post 'users/createLogin'
  get 'users/destroyLogin'
  get 'users/register'
  get 'users/create'
  post 'users/create'

  get 'dice_roller', to: 'utility#diceRoller'
  get 'levelCalculator', to: 'utility#levelCalculator'

  get 'random_generator', to: 'random_generator#index'

  get 'inventory/BOH'

  get 'inventory/createBOH'
  post 'inventory/createBOH'

  get 'inventory/newBOH'
  post 'inventory/newBOH'

  get 'inventory/showBOHs'
  post 'inventory/showBOHs'
  
  get 'inventory/deleteBOH'

  get 'inventory/showInventory'

  get 'inventory/deleteItem'

  get 'inventory/newItem'
  post 'inventory/createItem'
end
