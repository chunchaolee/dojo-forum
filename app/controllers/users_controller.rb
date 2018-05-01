class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    
  end

  def edit
    if @user.id != current_user.id
      redirect_back(fallback_location: posts_path)
      flash["alert"] = "非該會員，無法編輯該會員。"
    end
  end

  def update
    if current_user.is_admin
      if @user.update_attributes(user_level_params)
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

    if @user.id == current_user.id
      if @user.update_attributes(user_params)
        flash["notice"] = "User Profile更新成功"
        redirect_back(fallback_location: posts_path)
      else
        flash["alert"] = @user.errors.full_messages.to_sentence
        render :edit
      end
    end

  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_level_params
    params.require(:user).permit(:level, :is_admin)
  end

  def user_params
    params.require(:user).permit(:name, :description, :avatar)
  end
  
end
