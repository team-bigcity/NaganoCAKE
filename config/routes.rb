Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customer/sessions',
  passwords:     'customer/passwords',
  registrations: 'customer/registrations'
}

  #管理者
  namespace :admin do

    root to: 'tops#top'
    resources :order_products, only:[:update]

    resources :orders, only: [:index, :show, :update]

    resources :customers, only: [:show, :edit, :index, :update]

    resources :genres, only: [:index, :create, :edit]
    patch 'genres/:id', to: 'genres#update'

    resources :products, except: [:destroy, :update]
    patch 'products/:id', to: 'products#update'
  end

  #顧客
  scope module: :customer do
    get '/about', to: 'homes#about'

    resources :addresses, only: [:index, :create, :edit, :destroy]
    patch 'addresses/:id/update', to: 'addresses#update', as: 'addresss_update'

    resources :products, only: [:index, :show]
    root 'products#top'

    delete 'cart_products/destroy_all', to: 'cart_products#destroy_all'
    resources :cart_products, only: [:index, :create, :destroy]
    patch 'cart_products/:id', to: 'cart_products#update'


    get 'orders/complete'
    get 'orders/confirm'
    resources :orders, only: [:index, :show, :new, :create,]

    resources :customers, only: [:edit]
    get 'customers/destroy_page', to: 'customers#destroy_page'
    patch 'customers/leave', to: 'customers#leave'
    get 'customers/my_page'
    patch '/customers/:id/update', to: 'customers#update', as: 'customers_update'
    put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
