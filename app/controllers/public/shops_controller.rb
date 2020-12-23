class Public::ShopsController < ApplicationController
    def index
    	@shops = Shop.all
    end

    def create
    end

    def update
      @shop = Shop.find(params[:id])
      #shopのレコードを取ってくる
      @shop_record = @shop.new(shop_params)
      binding.pry
      #shopのレコードにからの箱を用意しフォームwidthで送られてきたデータを受け取る。
      #buinddingpryのレコードを頭でイメージする。
      #
      @shop_record.save
      @redirect_to.edit_public_shop_path(:shop_id)
      #saveする。


    # post_image = PostImage.find(params[:post_image_id])
    # comment = current_user.post_comments.new(post_comment_params)
    # comment.post_image_id = post_image.id
    # comment.save
    # redirect_to post_image_path(post_image)
    end

    def show
    	@shops = Shop.all
    end

    def edit
    	@shop = Shop.find(params[:id])
    end

    private
    def shop_params
    params.require(:shop).permit(:name, :food, :image)
    #.requireはshopコントローラーの.permitは:name とfoodとimageだけ受け取りますよ
    #という意味。
    #このimageはrefileのimageでimage_idだがここでは_idはいらない。
    end
end
