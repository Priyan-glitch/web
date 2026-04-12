Rails.application.routes.draw do
  namespace :api do
    resources :students do
      collection do
        get :search
      end
    end
  end
end
