class Admin::UsersController < Admin::BaseController

  ALLOW_QUERIES = %w[s name_cont email_cont is_admin_eq].freeze

  def index
    # ransack
    @q = User.ransack(ransack_params)
    @users = @q.result(distinct: true)
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def ransack_params
    if params[:q].present?
      params.require(:q).permit(*ALLOW_QUERIES)
    end
  end

end
