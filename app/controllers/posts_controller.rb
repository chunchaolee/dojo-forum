class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  
  def index
    @categories = Category.all
    @posts = Post.all
  end

end
