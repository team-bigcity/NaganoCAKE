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

    resources :genres, only: [:index, :create, :edit, :update]

    resources :products, except: [:destroy]
  end

  #顧客
  scope module: :customer do
    get '/about', to: 'homes#about'

    resources :addresses, only: [:index, :create, :edit, :destroy]
    patch 'addresses/:id/update', to: 'addresses#update', as: 'addresses_update'

    get 'genres/:id/sort', to: 'products#sort', as: 'genres_sort'
    resources :products, only: [:index, :show]
    root 'products#top'

    delete 'cart_products/destroy_all', to: 'cart_products#destroy_all'
    resources :cart_products, only: [:index, :create, :destroy]
    patch 'cart_products/:id', to: 'cart_products#update'

    get 'orders/complete'
    post 'orders/confirm'
    resources :orders, only: [:index, :show, :new, :create,]

    get 'customers/profile_edit', to: 'customers#edit', as: 'customers_edit'
    get 'customers/destroy_page', to: 'customers#destroy_page'
    patch 'customers/leave', to: 'customers#leave', as: 'customers_leave'
    get 'customers/my_page', to: 'customers#my_page'
    patch 'customers/profile_update', to: 'customers#update', as: 'customers_update'
  end

  get 'search' => 'searches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end