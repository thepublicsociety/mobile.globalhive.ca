Template::Application.routes.draw do
  
  resources :section_attachments


  resources :panel_attachments
  resources :item_attachments
  resources :post_attachments

  scope 'administration' do
    resources :contents
    resources :posts
    resources :items
    resources :panels do
      resources :items
    end
    resources :sections
    resources :terms
  end
  
  match "/administration" => "pages#admin", :as => "admin" #"user_root"
#  match "/home" => "pages#index", :as => "website"
  match '/mail' => 'pages#send_mail', :as => :email, :via => :post
  
  get "pages/index"
  get "pages/administration"

  devise_for :users, :path => 'administration/account', :controllers => {:registrations => "registrations", :sessions => "sessions", :passwords => "passwords"}
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "register", :to => "registrations#new"
    get "/administration/account/settings" => "registrations#edit"
  end
  
#  authenticated :user, lambda {|u| u.admin == true} do
#    root :to => "pages#admin", :as => :admin_root
#    match "/home" => "pages#index", :as => "website"
#  end
  
  match "/news" => "pages#news", as: "news"
  match "/about" => "pages#about", as: "about"
  match "/contact" => "pages#contact", as: "contact"
  match "/glossary" => "pages#glossary", as: "glossary"
  match "/term-select" => "pages#term_select"
  match "/term-all" => "pages#term_all"
  match "/search" => "pages#search", as: "search"
  match "/help" => "pages#help", as: "help"
  match "/explore" => "pages#explore", as: "explore"
  match "/expand" => "pages#expand", as: "expand"
  match "/hub/:id" => "pages#hub", as: "hub"
  match "/pdf/:id" => "pages#pdf", as: "pdf"
  match "/story/:id" => "pages#story", as: "story"
  match "/news/:title" => "pages#news_story", as: "news_story"
  match "/crop/:id" => "items#cropping"
  match "/arrange" => "items#arrange"
  match "/hist" => "pages#hist"
  match "/module/:id" => "pages#modules"
  root :to => "pages#index"

end
