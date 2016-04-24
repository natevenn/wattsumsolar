Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/solar_calculator', to: 'solar_calculator#show'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'install_summary', to: 'states#index'
      get 'install_summary/:name', to: 'states#show'
    end
  end
end
