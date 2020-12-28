class Public::ShopsController < ApplicationController
    def index
      #一覧表示、投稿コメント機能
    	@shops = Shop.all
      @shop = Shop.new
    end

    def create
      #投稿コメント機能
      #新しく作成する場所だからnewを使用する。
      @shop = Shop.new(shop_params)
      @shop.user_id = current_user.id
      if @shop.save
        redirect_back(fallback_location: public_users_home_path)
      else
        redirect_back(fallback_location: public_users_home_path)
      end
    end

    def update
      #画像のupdate
      #paramsでshopのurlの番号を取ってくる。
      #Shop.findで先ほどとってきた番号のレコードを引っ張ってくる。
      #findでレコードを取るのは存在するレコードにアップデートするため。
      @shop = Shop.find(params[:id])
      #(shop_params)で送ってきたデータを受け取ってupdateする。
      @shop.user_id = current_user.id
      @shop.update(shop_params)
      #指定のパスに遷移する。
      redirect_to public_shops_path
    end

    def show
      #show画面の表示
    	@shop = Shop.find(params[:id])
      @comments = @shop.comments
      @comment = Comment.new
    end

    def edit
       #edit画面の表示
    	@shop = Shop.find(params[:id])
    end

    def search
      #検索機能作成
      @shops = Shop.search(params[:search])
    end

    private
    #.requireはshopコントローラーの.permitは:name とfoodとimageだけ受け取りますよ
    #という意味。
    #このimageはrefileのimageでimage_idだがここでは_idはいらない。
    def shop_params
    params.require(:shop).permit(:name, :food, :image, :content)
    end
end
