class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

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
    if @post.save
      redirect_to posts_path
      flash["notice"] = "成功建立Post"
    else
      flash[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
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

end
