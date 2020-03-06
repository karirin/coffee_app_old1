class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def show
   @post = Post.new
   render "views/static_pages/post"
  end
end
