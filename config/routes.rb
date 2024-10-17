Rails.application.routes.draw do
  root "boards#index"

  resources :boards do
    resources :steps do
      resources :tasks
    end
  end
end
