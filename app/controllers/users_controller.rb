class UsersController < ApplicationController
  before_action :check, only: [:edit]
  before_action :set_params, only: [:edit, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to user_path(@user.id)
    else
      render "show"
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email, :profile, :image, :password, :password_confirmation)
  end

  def set_params
    @user = User.find(params[:id])
  end

  def check
    @user = User.find(params[:id])
    if current_user.id != @user
      redirect_to pictures_path, notice: "権限がありません"
    end
  end

end
