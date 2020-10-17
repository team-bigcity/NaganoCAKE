Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
  devise_for :customer, controllers: {
  sessions:      'customer/sessions',
  passwords:     'customer/passwords',
  registrations: 'customer/registrations'
}

  #管理者
  namespace :admin do
    patch 'order_products/:id', to: 'order_products#update'

    get '/', to: 'top#top'

    resources :orders, only: [:index, :show]
    patch 'orders', to: 'orders#update'

    resources :customers, only: [:show, :edit, :index]
    patch 'customers', to: 'customers#update'

    resources :genres, only: [:index, :create, :edit]
    patch 'genres', to: 'genres#update'

    resources :products, except: [:destroy, :update]
    patch 'products/:id', to: 'products#update'
  end

  #顧客
  scope module: :customer do
    get '/about', to: 'homes#about'

    resources :addresses, only: [:index, :create, :edit, :destroy]
    patch 'addresses/:id', to: 'addresses#update'

    resources :products, only: [:index, :show]
    root 'products#top'

    resources :cart_products, only: [:index, :create, :destroy]
    delete :cart_products, to: 'cart_products#destroy_all'
    patch 'cart_products/:id', to: 'cart_products#update'

    resources :orders, only: [:index, :show, :new, :create]
    post 'orders/confirm'
    get 'orders/complete'

    resource :customers, only: [:edit]
    delete 'customers/destroy_page', to: 'customers#destroy_page'
    patch 'customers/leave', to: 'customers#leave'
    get 'customers/my_page'
    patch '/customers', to: 'customers#update'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
