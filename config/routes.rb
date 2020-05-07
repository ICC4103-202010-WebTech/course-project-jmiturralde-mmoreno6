Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :users do
    resource :profile_pages, :mail_boxes
    resources :organizations, shallow: true
  end


end
