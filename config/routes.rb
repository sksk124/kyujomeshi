Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :customers do
    post 'customers/guest_sign_in', to: 'customers/sessions#new_guest'
  end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  get '/', to: 'public/homes#top', as: 'top'
  get '/about', to: 'public/homes#about', as: 'about'


  namespace :admin do
    resources :customers
    resources :reviews
    resources :ballparks
    resources :comments
  end

  scope module: :public do
    resources :customers
    resources :reviews
    resources :comments
  end


end
