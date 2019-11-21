class FavoritesController < ApplicationController

  def index
    @user = current_user
    @favorite = Favorite.where(user_id: @user.id).all
  end

  def show
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんの記事をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to picture_url, notice: "#{favorite.picture.user.name}さんの記事をお気に入り解除しました"
  end

  private

end
