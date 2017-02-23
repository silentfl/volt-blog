Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create]
      resources :comments, only: [:index]

      scope :reports, controller: :reports do
        post 'by_author', to: 'by_author'
      end
    end
  end
end
