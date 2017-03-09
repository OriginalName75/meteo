Rails.application.routes.draw do
  
  get 'plus/:l'  => 'plus#plus'

  get 'follow/source'

  get 'follow/foll'
  get 'follow/fol/:l' => 'follow#foll'
  get 'follow/unfoll/:l' => 'follow#unfoll'
 

  get 'rasb_pi/se'

  get 'rasb_pi/all'

  devise_for :rasb_secs, controllers: { sessions: 'rasb_sec/sessions',registrations: 'rasb_sec/registrations' }
  get 'ajax_user/changeImg'

  get 'ajax_user/changeAutre'

  get 'ajax_user/cropImg'

  get 'ajax_lieu/meteo'

  get 'liste_lieu/all'

  get 'ajax_lieu/lieu'
  post 'add' => 'rasb_pi#se'
   

  get 'lieux/index'

  get 'source/new'

  get 'source/create'

  devise_for :users
  root to: "source#new"
  get 'gen' => 'source#create'
  get 'mesures' => 'mesures#index'
  get 'all' => 'liste_lieu#all'
  get 'lieux/:l' => 'lieux#index'
  get 'lieux/:l/:i' => 'ajax_lieu#lieu'
  get 'ajax/:l' => 'ajax_lieu#meteo'
  get 'ajaxuser' => 'ajax_user#changeImg'
  get 'ajaxparams' => 'ajax_user#changeAutre'
  get 'ajaxrasb' => 'ajax_user#cropImg'
  patch 'ajaxparams/proxi' => 'ajax_user#updateParams'
  patch 'ajaxuser/proxi' => 'ajax_user#update'
  post 'ajaxrasb/proxi' => 'ajax_user#updateRasb'
  get 'mesures/:y/:m/:d' => 'mesures#index'
  get 'mesures/generator' => 'mesures#generator'
  get 'mesures/myown' => 'mesures#myown'
  get 'myspace/myown' => 'my_space#myown'
  post 'myspace/myown' => 'my_space#create'
  post 'mesures' => 'mesures#postH'
  post 'proxi' => 'source#proxi'
  resources :source do
    get :autocomplete_lieu_nom, :on => :collection
  end
  resources :ajax_user do
    get :autocomplete_user_email, :on => :collection
  end
  
end
