Rails.application.routes.draw do
  resources :book_suggestions, only: :new
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } do
    get "sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'book_suggestions#new'

  # API Endpoints
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :books, only: [:index, :show]
    resources :book_suggestions, only: :create
    resources :users do
      resources :rents, only: [:index, :create]
      collection do
        resources :sessions, only: [:create] do
          collection do
            post :renew
            post :invalidate_all
          end
        end
      end
    end
  end
end
