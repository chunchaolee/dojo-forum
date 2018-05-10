class Api::V1::PostsController < ApiController

  before_action :authenticate_user!, :except => [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    render json: {
      data: @posts
    }
  end

  def show
    if @post.who_can_see == "all"
      post_contents
    elsif @post.who_can_see == "friend"
      @user = User.find(@post.user_id)
      if @user.is_friend?(current_user) || current_user.is_admin
        post_contents
      else
        render json: {
          error: "ERROR",
          message: "無瀏覽權限，僅開放好友瀏覽/留言"
        }
      end
    elsif @post.who_can_see == "myself" 
      if current_user.id == @post.user_id || current_user.is_admin
        post_contents
      else
        render json: {
          error: "ERROR",
          message: "無瀏覽權限，僅作者能瀏覽！"
        }
      end 
    end    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: {
        message: "成功建立Post",
        result: @post
      }
    else
      render json: {
        errors: @post.errors
      }
    end
  end


  def update
    if @post.update_attributes(post_params)
      @post.is_published = true
      @post.save
      render json: {
        message: "成功更新Post",
        result: @post
      }
      return
    else
      render json: {
        errors: @post.errors
      }
    end
  end


  def destroy
    @post.destroy
    render json: {
      message: "成功刪除Post",
    }
  end


  private

  def post_params
    params.require(:post).permit(:title, :detail, :img, :who_can_see, :user_id, :category_ids => [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_contents
    @post.count_view
    render json: @post
    @user = @user = User.find(@post.user_id)
  end

end
