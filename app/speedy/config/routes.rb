Rails.application.routes.draw do
  resources :wpts
  resources :urls
  get 'jobs/scraper' => 'jobs#scraper'
  get 'jobs/:klass/async' => 'jobs#klass_async'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
