# frozen_string_literal: true

class PostsController < ApplicationController
  protect_from_forgery except: :create
  before_action :post_params, only: %i[confirm create]
  before_action :correct_user, only: :destroy

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save! 
    flash[:success] = '投稿されました。'
    redirect_to action: 'index'
  end

  def show
    @post = Post.find(params[:id])
  end

  def confirm
    @post = Post.new(post_params)
  end

  def index 
    @post = Post.new
    @posts = Post.all
#    @posts = Post.find_by("store_name = ?", params[:store_name]) 
    @posts = Post.paginate(page: params[:page], per_page: 6)
    @like = Like.new

    if params[:address_prefectures].present?
      @post = @post.get_by_address_prefectures params[:address_prefectures]
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿が削除されました。'
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:store_name, :address, :address_prefectures, :image, :time_start, :time_end, :wifi, :plug, :tabacco, :card, :evaluation1, :evaluation2, :evaluation3, :evaluation4, :evaluation5)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
