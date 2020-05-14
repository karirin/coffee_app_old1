# frozen_string_literal: true

class LikesController < ApplicationController
  protect_from_forgery except: %i[create destroy]
  before_action :set_post
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post_id: params[:post_id])
    @like.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
