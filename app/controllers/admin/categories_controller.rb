class Admin::CategoriesController < Admin::BaseController

  before_action :set_category, only: [:update, :edit, :update, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end

  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_back(fallback_location: admin_categories_path)
      flash[:notice] = "成功建立Cateogry"
    else
      @categories = Category.all
      flash[:alert] = "建立Cateogry失敗"
      render :index
    end
  end

  def update

    if @category.update_attributes(category_params)
      redirect_back(fallback_location: admin_categories_path)
      flash[:notice] = "成功更新Cateogry"
    else
      @categories = Category.all
      flash[:alert] = "更新Cateogry失敗"
      render :index
    end
    
  end

  def destroy
    if @category.posts.size > 0
      flash[:alert] = "刪除Cateogry失敗，已被使用的Categories!"
      redirect_back(fallback_location: admin_categories_path)
    else
      @category.destroy
    end
  end
  

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
