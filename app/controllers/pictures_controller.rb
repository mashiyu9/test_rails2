class PicturesController < ApplicationController
  before_action :set_picture, only: [:destroy, :edit, :show, :update]
  before_action :check, only: [:edit, :destroy, :update]
  def index
    @picture = Picture.all.reverse
  end

  def show
    if current_user.favorites.present?
      @favorite = current_user.favorites.find_by(picture_id: @picture)
      binding.pry
    end
  end

  def new
    if logged_in?
      @picture = Picture.new
    else
      redirect_to pictures_path, notice: "権限がありません"
    end
  end

  def create

    @picture = Picture.new(params_picture)
    @picture.user_id = current_user.id
    if params[:back].present?
      render 'new'
    elsif @picture.save
      ConfirmMailer.confirm_mail(@picture).deliver
      redirect_to pictures_path, notice: "記事を作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @picture.user_id = current_user.id
    if params[:back]
      render :new and return
    elsif @picture.update(params_picture)
      redirect_to pictures_path, notice: "記事を更新しました"
    else
      render 'edit'
    end
  end

  def confirm
    @picture = Picture.new(params_picture)
    @picture.user_id = current_user.id
    @picture.id = params[:id]
    render :new if @picture.invalid?
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "記事を削除しました"
  end

  private

  def params_picture
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def check
    if current_user.id != @picture.user_id
      redirect_to pictures_path, notice: "権限がありません"
    end
  end

end
