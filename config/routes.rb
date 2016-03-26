Rails.application.routes.draw do

  scope format: false do
    root 'index#index'
    post '/', to: 'index#search', as: 'search'
  end

end
