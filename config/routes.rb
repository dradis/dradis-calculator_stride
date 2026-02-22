Dradis::Plugins::Calculators::STRIDE::Engine.routes.draw do
  get '/calculators/stride' => 'base#index'

  resources :projects, only: [] do
    resources :issues, only: [] do
      member do
        get 'stride' => 'issues#edit'
        patch 'stride' => 'issues#update'
      end
    end
  end
end
