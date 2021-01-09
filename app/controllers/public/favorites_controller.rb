class Public::FavoritesController < ApplicationController
  def create
  	@shop = shop = Shop.find(params[:id])
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    favorite = current_user.favorites.build(shop_id: params[:shop_id])
    favorite.save
  end

  def destroy
    @shop = Shop.find(params[:id])
  	favorite = Favorite.find_by(shop_id: params[:shop_id], user_id: current_user.id)
    favorite.destroy
  end
end