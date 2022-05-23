Rails.application.routes.draw do
  root "dashboard#index"

  resources :dashboard, only: [:index]

  devise_for :users
  
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :categories, except: [:show]
    resources :books, except: [:show]
    resources :users, only: [:index]
  end

  namespace :user do
    resources :dashboard, only: [:index] do
      member do
        get :favorite_books, as: :favorite_books
      end

      collection do
        post "add_or_remove_favorite_books/:book_id", to: "dashboard#add_or_remove_favorite_books", as: :add_or_remove_favorite_books
      end
    end
  end
end
