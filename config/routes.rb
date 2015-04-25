Rails.application.routes.draw do
  resources :questions do
	  resources :answers
  end

	root 'static_pages#home'
	get 'help' => 'static_pages#help'
	get 'about' => 'static_pages#about'
	get 'signup' => 'users#new'
	get 'signin' => 'sessions#new'
	post 'signin' => 'sessions#create'
	delete 'signout' => 'sessions#destroy'
  devise_for :users
  resources :answers
  get  '/answers/:answer_id' => redirect( '/questions/:question_id/answers'	)
  resources :users
  
  
end
