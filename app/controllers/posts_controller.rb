class PostsController < ApplicationController
  def index
  	@posts = Post.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:success] = "The post has been created"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(post_params)
  		flash[:success] = "The post has been edited"
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post = Post.find(params[:id]).destroy
  	flash[:success] = "The post has been deleted"
  	redirect_to dashboard_path
  end

  private 
  def post_params
  	params.require(:post).permit(:title, :content)
  end
end
