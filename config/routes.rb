Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get 'install_summary', to: 'states#index'
    end
  end
end
