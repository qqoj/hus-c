Rails.application.routes.draw do

  scope format: false do
    root 'index#index'
    post '/', to: 'index#search', as: 'search'
    get '/corporation', to: 'index#corporation', as: 'corporation'
  end

end
