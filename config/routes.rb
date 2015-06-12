Rails.application.routes.draw do
   get 'contacts/new'

  devise_for :accounts,  skip: :registrations
  get 'categories/index'

  root 'plants#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'chat' =>'chats#index'
  get 'login'    => 'sessionss#new'
  get 'registry' => 'accountss#new'
  post 'registry' => 'accountss#create'
   
  delete 'login' => 'sessionss#destroy'
  controller :sessionss do
      post 'login'   => :create
      get 'sessionss/destroy' => 'sessionss#destroy'
  end

  resources :accountss do
     member do
          post "edit" => 'accountss#update'
    end
  end
  controller :accountss do
        post 'accountss/new' => 'accountss#create'
  end
  resources :plants
  resources :categories
  resources :contacts 
  resources :shops
  resources :searchs
  resources :news
  resources :advs do
    get 'destroy'
    get 'destroy_message'
    member do
          post "edit" => 'advs#update'
    end
    collection do
          get 'advs/add_message'
    end
  end
  controller :advs do
        post 'advs/new' => 'advs#create'
  end
  controller :contacts do
        post 'contacts/new' => 'contacts#create'
    end
end
