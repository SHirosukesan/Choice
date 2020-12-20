class Public::UsersController < ApplicationController
  def home

  end

  def top

  end

  def show

  end

  def edit

  end

  def new_guest
    user = User.find_or_create_by!(email: 'hoge1@hoge.com') do |user|
      user.password = 123456
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
