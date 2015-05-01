class FollowsController < ApplicationController
  before_action :set_follow
  def index
  end

  def create
    Follow.create
    redirect_to following_path, change: 'following'
  end

  def destroy
    @follow.destroy
    redirect_to following_path, change: 'following'
  end

  private

  def set_follow
    @follow = Follow.first
  end
end
