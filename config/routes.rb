Rails.application.routes.draw do
  root 'boards#index'
  
  resources :boards do
    resources :steps, except: [:index, :show] do
      resources :tasks, except: [:index, :show]
    end
  end
end