class PicturesController < ApplicationController
  def index
    @picture = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params_picture)
    if @picture.save
      redirect_to pictures_path, notice: "記事を作成しました"
    else
      render 'new'
    end
  end

  def update
  end

  def confirm
    @picture = Picture.new(params_picture)
    # @picture.user_id = current_user.id
    @picture.id = params[:id]
    render :new if @picture.invalid?
  end

  private

  def params_picture
    params.require(:picture).permit(:title, :content, :image)
  end
end
