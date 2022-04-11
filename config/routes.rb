Rails.application.routes.draw do
# devise
  # 管理者用(URL /admin/sign_in ...)
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
  }
  # ユーザ用(URL /users/sign_in ...)
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

# その他
  #管理者用
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :projects, only: [:index, :show, :edit, :update, :destroy] do
      resources :backers, only: [:index]
      resources :participants, only: [:index]
    end
    resources :categories, only: [:index, :create, :show, :edit, :update, :destroy]
  end
  # ユーザ用
  root to: "public/homes#top"
  get "about" =>"public/homes#about"
  get "users/my_page" => "public/users#show"
  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      collection do
        # 退会確認画面
        get 'unsubscribe'
        # 論理削除用のルーティング
        patch 'withdraw'
        # 支援プロジェクト一覧表示※部分テンプレートのため実装不要→URL取得に変更
        get 'backer'
        get 'participant'
        get 'owner'
      end
    end
    resources :projects, only: [:new, :create, :index, :show, :edit, :update] do
      resources :returns, only: [:new, :create, :index, :show, :edit, :update] do
        collection do
          get 'selects'
        end
      end
      resources :backers, only: [:new, :create, :index] do
        collection do
          post 'log'
          get 'complete'
        end
      end
      resources :participants, only: [:new, :create, :index, :edit, :update] do
        collection do
          post 'log'
          get 'complete'
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


  # namespace :admin do
  #   get 'participants/index'
  # end
  # namespace :admin do
  #   get 'backers/index'
  # end
  # namespace :admin do
  #   get 'categories/index'
  #   get 'categories/show'
  #   get 'categories/edit'
  # end
  # namespace :admin do
  #   get 'projects/index'
  #   get 'projects/show'
  #   get 'projects/edit'
  # end
  # namespace :admin do
  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  # end
  # namespace :public do
  #   get 'participants/new'
  #   get 'participants/log'
  #   get 'participants/complete'
  #   get 'participants/index'
  #   get 'participants/edit'
  # end
  # namespace :public do
  #   get 'backers/new'
  #   get 'backers/log'
  #   get 'backers/complete'
  #   get 'backers/index'
  # end
  # namespace :public do
  #   get 'returns/new'
  #   get 'returns/index'
  #   get 'returns/edit'
  # end
  # namespace :public do
  #   get 'projects/new'
  #   get 'projects/index'
  #   get 'projects/show'
  #   get 'projects/edit'
  # end
  # namespace :public do
  #   get 'users/show'
  #   get 'users/edit'
  # end
  # namespace :public do
  #   get 'homes/top'
  #   get 'homes/about'
  # end