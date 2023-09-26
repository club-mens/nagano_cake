Rails.application.routes.draw do

  devise_scope :customer do
    get '/customers/sign_out' => 'devise/sessions#destroy'
  end


  scope module: :public  do
    root to: 'homes#top'
    get '/about' => 'homes#about'

    resources :items, only: [:index, :show]

      get 'customers/my_page' => 'customers#show'
      get 'customers/information/edit' => 'customers#edit'
      patch 'customers/informaiton' => 'customers#update'

      get 'customers/confirm' => 'customers#confirm'
      patch 'customers/withdrawal' => 'customers#withdrawal'

    resources :cart_items, only: [:index, :update, :destroy, :create]
      delete 'cart_items/destroy_all' => 'cart_item#destroy_all'

    resources :orders, only: [:new, :create, :index, :show]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/complete' => 'orders#complete'

    resources :addresses, except: [:new, :show]

  end


  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]

    resources :genres, except: [:new, :show, :destory]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:show, :update]

    resources :order_details, only: [:update]

  end







 # 顧客用
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
