Rails.application.routes.draw do
  devise_for :users
  	root to: 'posts#index'
  	#devise_for :users

	resources :posts do
		collection do
			get 'unapproved'
		end
		member do
			get 'vote'
			patch 'voteCast'
			get 'viewAll'
			
		end
	end
end
