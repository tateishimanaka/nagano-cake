Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwards: 'admin/passwards',
    registrations: 'admin/registrations'
  }
  devise_for :customer, controllers: {
    sessions: 'public/sessions',
    passwards: 'public/passwards',
    registrations: 'public/registrations'
  }

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about_path"
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update]
    get "/customers/unsubscribe" => "customers#unsubscribe", as: "customer_unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw", as: "customer_withdraw"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "cart_item_destroy"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    post "/orders/comfilm" => "orders#comfilm", as: "order_comfilm"
    get "/orders/complete" => "orders#complete", as: "order_complete"
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end
end

