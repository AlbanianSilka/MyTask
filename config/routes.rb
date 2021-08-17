Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    get :swap_words
    # collection do
    #   patch :swap_words
    # end
  end

  resources :keywords
  root "posts#index"
end
