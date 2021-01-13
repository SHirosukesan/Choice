class Public::ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
  end

  def create
  	shop = Shop.find(params[:shop_id])
  	@article = shop.articles.build(article_params)
    @article.user_id = current_user.id
    if @article.save!
    	redirect_to public_shop_path(current_user)
    else
    	redirect_to public_shop_path(current_user)
    end
  end

  def update
      user = User.find(params[:id])
      #(shop_params)で送ってきたデータを受け取ってupdateする
      @article = user.articles.build(article_params)
      #@article.user_id = current_user.id
      @article.update(article_params)
      #指定のパスに遷移する。
      redirect_to public_shops_path
  end


  def article_params
      params.require(:article).permit(:title, :address, :latitude, :longitude)
    end
end
