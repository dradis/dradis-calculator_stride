Dradis::Plugins::Calculators::STRIDE::Engine.routes.draw do
  get '/calculators/stride' => 'base#index'

  scope '/calculators/stride' do
    resources :fields, only: :index
  end

  resources :projects, only: [] do
    resources :issues, only: [] do
      member do
        get 'stride' => 'issues#edit'
        patch 'stride' => 'issues#update'
      end
    end
  end
end
