Rails.application.routes.draw do

  scope format: false do
    root 'index#index'
  end

end
