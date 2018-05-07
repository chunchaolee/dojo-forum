class FriendshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    @friendship = current_user.friendships.create!(friend_id: params[:friend_id])
    @user = User.find(params[:friend_id])
  end

  def destroy

    @user = User.find(params[:id])
    if @friend = current_user.friendships.where(friend_id: params[:id]).first
      @friend.destroy
    else
      @applier = User.find(params[:id])
      @friend_application = @applier.friendships.where(friend_id: current_user.id).first
      @friend_application.destroy 
      redirect_back(fallback_location: user_path(@user))
    end

  end
 
    
end
