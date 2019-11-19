class AdduserRefToFavorite < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :picture_id, :string
    add_reference :favorites, :picture, foreign_key: true
  end
end
