Rails.application.routes.draw do

  scope format: false do
    root 'index#index'
    get '/search', to: redirect('/')
    post '/search', to: 'index#search'
  end

end
