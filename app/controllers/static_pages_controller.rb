# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
      @posts = Post.new
      @posts = Post.all
      @user = current_user
      @myfeed_items = current_user.myfeed.paginate(page: params[:myfeed_items_page], per_page: 3)
      @followingfeed_items = current_user.followingfeed.paginate(page: params[:followingfeed_items_page], per_page: 3)
      @likingfeed_items = current_user.likingfeed.paginate(page: params[:likingfeed_items_page], per_page: 3)
    end
  end
end
