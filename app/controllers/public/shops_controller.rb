class Public::ShopsController < ApplicationController
    def index
    	@shops = Shop.all
    end

    def create
    end

    def update
      @shop = Shop.find(params[:shopp_id])
      #shopのレコードを取ってくる
      buindingpry
      @shop_record = @shop.new(shop_params)
      #shopのレコードにからの箱を用意しフォームwidthで送られてきたデータを受け取る。
      #buinddingpryのレコードを頭でイメージする。
      @shop_record.save
      #saveする。
    end

    def show
    	@shops = Shop.all
    end

    def edit
    	@shop = Shop.new
    end

    private
    def shop_params
    params.require(:shop).permit(:name, :food, :image)
    #.requireはshopコントローラーの.permitは:name とfoodとimageだけ受け取りますよ
    #という意味。
    #このimageはrefileのimageでimage_idだがここでは_idはいらない。
    end
end
