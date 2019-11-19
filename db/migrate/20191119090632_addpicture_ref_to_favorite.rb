class AddpictureRefToFavorite < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :user_id, :string
    add_reference :favorites, :user, foreign_key: true
  end
end
