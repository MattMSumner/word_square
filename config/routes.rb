Words::Application.routes.draw do
  root 'high_voltage/pages#show', id: 'homepage'
  resources :word_squares, only: [:create, :show]
end
