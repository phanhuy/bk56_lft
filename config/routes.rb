Rails.application.routes.draw do
  get 'tag/list_tags'

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
  
  get 'tags/:tag', to: 'questions#index', as: "tag"
  get 'tags' => 'tag#list_tags'
  resources :links do 	 
    put "like", to: "links#upvote"
    put "dislike", to: "links#downvote"
  end
  
  put '/questions/:id/:action' => 'questions#upvote'
	put '/questions/:id/:action' => 'questions#downvote'
  put '/questions/:id/answers/:id/:action' => 'answers#upvote'
	put '/questions/:id/answers/:id/:action' => 'answers#downvote'
	
  resources :categories	
	
end
