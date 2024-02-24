# frozen_string_literal: true

Rails.application.routes.draw do
  resources :people do
    member do
      get :full_detail
    end
  end
  root to: 'people#index'

  namespace :api do
    namespace :v1 do
      resources :people, format: 'json' do
        collection do
          post :create_with_detail
        end
      end
      resources :details, format: 'json'
    end
  end
end
