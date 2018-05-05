class RepliesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_reply, only: [:update, :destroy]

  def edit
    @reply = Reply.find(params[:id])
    @post = Post.find(params[:post_id])
    @user = User.find(@post.user_id)
    @replies = @post.replies.order(created_at: :desc).page(params[:page]).per(20)
  end

  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      @post.last_replied_at = @reply.created_at
      @post.save
      redirect_back(fallback_location: post_path(@post))
      flash[:notice] = "成功留下評論"
    else
      flash[:alert] = @reply.errors.full_messages.to_sentence
      redirect_back(fallback_location: post_path(@post))
    end
  end

  def update
    @post = Post.find(params[:post_id])
    if @reply.user_id = current_user.id
      if @reply.update(reply_params)
        redirect_to post_path(@post)
        flash[:notice] = "成功更新comment"
      else
        flash[:alert] = @reply.errors.full_messages.to_sentence
        redirect_back(fallback_location: post_path(@post))
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @reply.destroy
    redirect_to post_path(@post)
    flash[:notice] = "成功刪除comment"
  end

  private

  def reply_params
    params.require(:reply).permit(:comment)
  end

  def set_reply
    @reply = Reply.find(params[:id])
  end

end
