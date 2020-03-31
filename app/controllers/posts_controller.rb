class PostsController < ApplicationController
before_action :post_params, only: :confirm
before_action :correct_user,   only: :destroy
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def confirm
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!
  end
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 6)
    @like = Like.new
  end
  
  def destroy
    @post.destroy
    flash[:success] = "post deleted"
    redirect_to request.referrer || root_url
  end
  
  private

  def post_params
    params.require(:post).permit(:store_name, :address, :image, :time_start, :time_end, :environment)
  end
  
  def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
  end
end
