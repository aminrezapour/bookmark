class UsersController < ApplicationController
  def show
    @user = current_user
    @user_topics = @user.topics
    @user_links = @user.links
    @user_likes = @user.likes
  end
end
