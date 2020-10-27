Rails.application.routes.draw do
  devise_for :users, path: 'tfc-accesos', path_names: { sign_in: 'iniciar_sesion', sign_out: 'cerrar_sesion'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
  	resources :users do
  		collection do
        get :dashboard
        get :exportar_registros
	  	end
	  end
	  resources :personales
  end

  get	'/crear_desde_api', to: 'registros#crear_desde_api'
  get '/obtener_registros', to: 'registros#obtener_registros'

  root to: 'registros#new'
end
