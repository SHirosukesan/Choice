class Public::ArticlesController < ApplicationController
  def show
  end


  def article_params
      params.require(:article).permit(:address, :latitude, :longitude)
    end
end
