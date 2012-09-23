Api::Application.routes.draw do

  resources :medias

  root :to => "medias#index"
end
