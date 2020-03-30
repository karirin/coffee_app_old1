class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @post = current_user.posts.build
      @myfeed_items = current_user.myfeed.paginate(page: params[:page], per_page: 3)
      @followingfeed_items = current_user.followingfeed.paginate(page: params[:page], per_page: 3)
    end
  end
end
