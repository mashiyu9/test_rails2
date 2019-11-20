class PicturesController < ApplicationController
  before_action :set_picture, only: [:destroy, :edit, :show]
  def index
    @picture = Picture.all.reverse
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params_picture)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "記事を作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @picture = Picture.find(params[:id])
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
end
