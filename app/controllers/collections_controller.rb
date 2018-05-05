class CollectionsController < ApplicationController

  before_action :authenticate_user!

  def create
    @collection = current_user.collections.create!(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:id])
    @collection = current_user.collections.where(post_id: params[:id]).first
    @collection.destroy
  end

end
