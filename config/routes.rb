Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :tasks do
        collection do
          get :hello
        end
      end
    end
  end
end
