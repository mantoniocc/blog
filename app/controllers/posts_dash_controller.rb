class PostsDashController < ApplicationController
  def index
  	@posts = Post.paginate(:page => params[:page], :per_page => 10)
  end
end
