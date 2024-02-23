# frozen_string_literal: true

Rails.application.routes.draw do
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
