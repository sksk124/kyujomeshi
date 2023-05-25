Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  get '/', to: 'public/homes#top', as: 'top'
  get '/about', to: 'public/homes#about', as: 'about'
  post '/homes/guest_sign_in', to: 'public/homes#guest_sign_in'



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
