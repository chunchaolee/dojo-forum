class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  ALLOW_QUERIES = %w[s replies_count title_cont viewed_count :last_replied_at_cont ].freeze

  def index
    @categories = Category.all
    @q = Post.ransack(ransack_params)
    @posts = @q.result(distinct: true).order(id: :desc)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
      flash["notice"] = "成功建立Post"
    else
      flash[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @reply = Reply.new
    @replies = @post.replies.order(created_at: :desc).page(params[:page]).per(20)
  end

  def edit
    
  end

  def update
    if @post.user_id == current_user.id
      if @post.update_attributes(post_params)
        redirect_to post_path(@post)
        flash["notice"] = "成功更新Post"
      else
        flash[:alert] = @post.errors.full_messages.to_sentence
        render :edit
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
