class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:update]

  def show
    
  end

  def update
    if current_user.is_admin
      if @user.update_attributes(user_params)
        if @user.level == "1"
          @user.is_admin = true
          @user.save!
        elsif @user.level == "2"
          @user.is_admin =false
          @user.save!
        end
        flash["notice"] = "權限變更成功"
        redirect_to admin_users_path
      end
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:level, :is_admin)
  end
  
end
