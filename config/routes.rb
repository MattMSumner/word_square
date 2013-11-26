Words::Application.routes.draw do
  root 'high_voltage/pages#show', id: 'homepage'
  resources :word_squares, only: [:new, :create, :show]
end
