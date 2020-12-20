class Public::ShopsController < ApplicationController
  def new
  end

  def create
  end

  def index
  	@shops = Shop.all
  end

  def show
  end
end
