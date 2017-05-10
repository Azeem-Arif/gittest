class Post < ApplicationRecord
	#default_scope { order(created_at: :desc) }
	
	validates :title, presence: true

	belongs_to :user


end