class PostsController < ApplicationController
before_action :post_params, only: [:confirm]
  
  def new
    @post = Post.new
  end
  
  def confirm
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!
  end
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end
  
  private

  def post_params
    params.require(:post).permit(:store_name, :address, :image, :time_start, :time_end, :environment)
  end
end
