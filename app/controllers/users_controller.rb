class UsersController < ApplicationController

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
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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

end
