Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, path: 'api' do
    namespace :v1, path: 'v1' do
      post 'init', to: 'accounts#init'

      get 'wallet', to: 'wallets#index'
      patch 'wallet', to: 'wallets#update'
      resources :wallets, path: 'wallet', only: %i[create] do
        collection do
          get 'transactions', to: 'wallets#transactions'
          post 'deposits', to: 'wallets#deposits'
          post 'withdrawals', to: 'wallets#withdrawals'
        end
      end
    end
  end
end
