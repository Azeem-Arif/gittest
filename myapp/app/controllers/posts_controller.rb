class PostsController < ApplicationController
before_action :authenticate_user! , :only => [:edit, :update, :destroy]
	before_action :do_this, :only => [:show, :edit, :update, :destroy ,:vote ,:voteCast]

	def index
		
		
		# @posts = Post.all.order(created_at: :desc)
		@posts = Post.where(status: true).order(created_at: :desc)

		@mypost = Post.new

	end

	def show
		# @post = Post.find(params[:id])
	end

	def update
		# @post = Post.find(params[:id])

		if	@post.update_attributes(post_params)
			redirect_to posts_path, :notice => "Your post was successfully Updated"
		else
			render "edit"
		end

	end

	def edit
		# @post = Post.find(params[:id])
	end

	def new
		@mypost = Post.new

	end

	def create
		@mypost = Post.new(post_params)
		# if user_signed_in?
			@mypost.user_id = current_user.id

		# else
			respond_to do |format|
				if @mypost.save
					@posts = Post.all
					format.html {redirect_to posts_path, :notice => "successfully created"}
					format.js   {}
				else
					format.html { render :new}
				end
			# end
		end
	end

	def destroy
		# @post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Deleted successfully"

	end

	def vote

		# @post = Post.find(params[:id])

	end

	def voteCast
		 # @post = Post.find(params[:id])
		if	@post.update_attributes(my_params)
			redirect_to posts_path, :notice => "Vote casted successfully"
		else
			render "edit"
		end
	end

	def viewAll
		@post = Post.where("user_id = ? ", params[:id])
	end

	def unapproved
		
		@unapproved = Post.where(status: false)

	end



private
	def post_params
		params.require(:post).permit(:title,:content,:status)
	end

	def my_params
		params.require(:post).permit(:vote)
	end

	def do_this
		@post = Post.find(params[:id])
	end
	
end