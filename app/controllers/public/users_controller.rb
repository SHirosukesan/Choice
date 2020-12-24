class Public::UsersController < ApplicationController

  def home

  end

  def top

  end

  def show

  end

  def update
     #paramsでshopのurlの番号を取ってくる。
      #Shop.findで先ほどとってきた番号のレコードを引っ張ってくる。
      #findでレコードを取るのは存在するレコードにアップデートするため。
      @user = User.find(params[:id])
      #(shop_params)で送ってきたデータを受け取ってupdateする。
      @user.update(user_params)
      #指定のパスに遷移する。
      redirect_to public_user_path(@user.id)
  end

  def edit
      @user = User.find(params[:id])
  end

  def new_guest
    user = User.find_or_create_by!(email: 'hoge1@hoge.com') do |user|
      user.password = 123456
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  private
  def user_params
    params.require(:user).permit(:name, :image)
  end
end
