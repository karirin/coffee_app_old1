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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿が編集されました。'
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    @hash = Gmaps4rails.build_markers(@post) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
    end
  end

  def confirm
    @post = Post.new(post_params)
    @post.user = current_user
    return if @post.valid?

    render :new
  end

  def index
    @post = Post.new
    @postall = Post.all
    @like = Like.new
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).paginate(page: params[:page], per_page: 6)
  end

  def destroy
    @post.destroy
    flash[:danger] = '投稿が削除されました。'
    redirect_to root_url
  end

  def map
    @posts = Post.all
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      #      marker.infowindow render_to_string(partial: 'static_pages/show', locals: { post: @post })
      # post.imageが検索できないため後回し
    end
  end

  private

  def post_params
    params.require(:post).permit(:user, :store_name, :address, :address_prefectures, :image, :time_start, :time_end, :wifi, :plug, :tabacco, :card, :evaluation1, :evaluation2, :evaluation3, :evaluation4, :evaluation5)
  end

  def search_params
    params.require(:q).permit(:store_name_cont, :sorts)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
