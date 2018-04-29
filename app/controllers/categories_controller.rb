class CategoriesController < ApplicationController

  before_action :authenticate_user!
  ALLOW_QUERIES = %w[s replies_count title_cont viewed_count :last_replied_at_cont ].freeze

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @q = @category.posts.ransack(ransack_params)
    @posts = @q.result(distinct: true).order(id: :desc)
  end

  def ransack_params
    if params[:q].present?
      params.require(:q).permit(*ALLOW_QUERIES)
    end
  end

end
