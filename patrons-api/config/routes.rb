Rails.application.routes.draw do
  resources :patrons
  resources :patrons do
    collection do
      get :find_by_ids
    end
  end
end
