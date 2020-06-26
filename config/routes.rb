Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      omniauth_callbacks: 'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'search', to: 'pages#search'

  resources :users do
    resource :profile_pages
    resource :mail_boxes do
      resource :messages
    end
    resources :organizations, shallow: true
    resources  :organization_invitations, shallow: true
    resources :events, shallow: true do
      get 'new_invitation', as: :new_invitation_otf
    end
    resources  :event_invitations, shallow: true
    resources :notifications
  end

  resources :organizations do
    resources :organization_invitations
  end

  resources :events do
    resources :comments
    resources :event_invitations
    resources :event_dates
  end

  resources :event_invitations do
    resources :user_votes
  end

  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :events do
        resources :comments, shallow: true
      end
    end
  end

  namespace :admin do
    resources :organizations, :users
    resources :events do
      resources :comments
    end
  end
end
