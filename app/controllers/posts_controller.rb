class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  ALLOW_QUERIES = %w[s replies_count title_cont viewed_count :last_replied_at_cont ].freeze

  def index
    @categories = Category.all
    @q = Post.ransack(ransack_params)
    @posts = @q.result(distinct: true).where(is_published: true).order(id: :desc).page(params[:page]).per(20)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if params[:commit] == 'Create Post'
      @post.is_published = true
      if @post.save
        redirect_to posts_path
        flash["notice"] = "成功建立Post"
      else
        flash[:alert] = @post.errors.full_messages.to_sentence
        render :new
      end
    elsif params[:commit] == 'Save Draft'
      @post.is_published = false
      if @post.save
        redirect_to user_path(current_user)
        flash["notice"] = "成功儲存Draft"
      else
        flash[:alert] = @post.errors.full_messages.to_sentence
        render :new
      end
    end
  end

  def show
    @post.count_view
    @reply = Reply.new
    @replies = @post.replies.order(created_at: :desc).page(params[:page]).per(20)
  end

  def edit
    
  end

  def update
    if params[:commit] == 'Update Draft'
      if @post.update_attributes(post_params)
        flash["notice"] = "成功更新Draft"
        redirect_to user_path(current_user)
        return
      end
    elsif params[:commit] == 'Create Post'
      if @post.update_attributes(post_params)
        @post.is_published = true
        @post.save
        flash["notice"] = "成功建立Post"
        redirect_to posts_path
        return
      else
        flash[:alert] = @post.errors.full_messages.to_sentence
        render :edit
      end
    elsif params[:commit] == 'Update Post'
      if @post.update_attributes(post_params)
        flash["notice"] = "成功更新Post"
        redirect_to post_path(@post)
        return
      end
    end

  end

  def destroy
    @post.destroy
    redirect_to posts_path
    flash["notice"] = "成功刪除Post"
  end


  private

  def post_params
    # params[:post][:category_ids] ||= []
    params.require(:post).permit(:title, :detail, :img, :who_can_see, :user_id, :category_ids => [])
  end

  def ransack_params
    if params[:q].present?
      params.require(:q).permit(*ALLOW_QUERIES)
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
