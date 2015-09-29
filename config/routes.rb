Rails.application.routes.draw do
  root "food_trucks#index"
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }
  authenticate :user do
    resources :food_trucks, only: [:new, :create, :destroy] do
      resources :reviews, only: [:new, :create, :destroy]
    end
  end
  resources :food_trucks, only: [:index, :show,
                                :new, :create] do
    resources :reviews
  end

  resources :users, only: :show

  as :user do
    get 'users', to: 'users#show', as: :user_root
  end
end
