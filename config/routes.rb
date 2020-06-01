Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'search', to: 'pages#search'

  resources :users do
    resource :profile_pages, :mail_boxes
    resources :organizations, shallow: true
    resources  :organization_invitations, shallow: true
    resources :events, shallow: true
    resources  :event_invitations, shallow: true
    resources :notifications
  end

  resources :events do
    resources :comments
  end

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :events do
        resources :comments, shallow: true
      end
    end
  end

end
