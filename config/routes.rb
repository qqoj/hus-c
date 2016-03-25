Rails.application.routes.draw do

  scope format: false do
    root 'index#index'
    post '/search', to: 'index#search'
  end

end
