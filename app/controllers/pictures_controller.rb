class PicturesController < ApplicationController
  before_action :set_picture, only: [:destroy]
  def index
    @picture = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params_picture)
    # binding.pry
    if @picture.save
      redirect_to pictures_path, notice: "記事を作成しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def confirm
    @picture = Picture.new(params_picture)
    # @picture.user_id = current_user.id
    @picture.id = params[:id]
    # render :new if @picture.invalid?
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "記事を削除しました"
  end

  private

  def params_picture
    params.require(:picture).permit(:title, :content, :image)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
