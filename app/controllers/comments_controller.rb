class CommentsController < ApplicationController
	
	def index
		@comments = Comment.all	
	end

	def new
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.save
			flash[:success] = "Comment has been created"
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:name, :email, :content)			
		end

end
